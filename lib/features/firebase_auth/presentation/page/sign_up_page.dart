import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadium_app/core/utils/constants.dart';
import 'package:stadium_app/features/firebase_auth/domain/entities/user_entity.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/user/user_cubit.dart';
import 'package:stadium_app/features/home/presentation/pages/home_page.dart';
import 'package:stadium_app/widget/base_widget/email_input.dart';
import 'package:stadium_app/widget/base_widget/loadingScreen.dart';
import 'package:stadium_app/widget/base_widget/normal_textfield.dart';
import 'package:stadium_app/widget/base_widget/password_input.dart';
import 'package:stadium_app/widget/home_widget/bottom_navigation_bar.dart';
// import 'package:stadium_app/widget/base_widget/snack_bar_error.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final surNameController = TextEditingController();
  // final roleController = TextEditingController();

  // final GlobalKey<ScaffoldState> _scaffoldGlobalKey =
  //     GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    firstNameController.dispose();
    surNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: _scaffoldGlobalKey,
        backgroundColor: Colors.white,
        body: BlocConsumer<UserCubit, UserState>(
          builder: (context, userState) {
            if (userState is UserLoading) {
              return buildLoadingScreen();
            } else if (userState is UserSuccess) {
              return BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, authState) {
                if (authState is Authenticated) {
                  return const MyBottomNavigationBar();
                } else {
                  return _bodyWidget();
                }
              });
            }
            return _bodyWidget();
          },
          listener: (context, userState) {
            if (userState is UserSuccess) {
              context.read<AuthCubit>().loggedIn();
            }
            if (userState is UserFailure) {
              // snackBarError(
              //     msg: "Oops, something wrong",
              //     scaffoldState: _scaffoldGlobalKey);
              //handle error, maybe i'll use alertBox
            }
          },
        ));
  }

  _bodyWidget() {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //title
              const Text(
                'ສະມັກສະມາຊິກ',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),

              //first name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: NormalInputField(
                    controller: firstNameController, hintText: 'ຊື່'),
              ),
              const SizedBox(height: 20.0),

              //sur name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: NormalInputField(
                    controller: surNameController, hintText: 'ນາມສະກຸນ'),
              ),
              const SizedBox(height: 20.0),

              //email input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: EmailInputField(
                    controller: emailController,
                    hintText: 'Email: name@example.com'),
              ),
              const SizedBox(height: 20.0),

              //password input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: PasswordInputField(
                  controller: passwordController,
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 20.0),

              //confirm password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: PasswordInputField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                ),
              ),
              const SizedBox(height: 20.0),

              //sign up button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: GestureDetector(
                  onTap: () => {
                    submitSignUp(),
                    clearText(),
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              //not a member? register now.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, SIGN_IN_ROUTE, (route) => false),
                      Navigator.pushNamed(context, SIGN_IN_ROUTE),
                    },
                    child: const Text(
                      ' Login now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitSignUp() {
    bool firstName = firstNameController.text.trim().isNotEmpty;
    bool surName = surNameController.text.trim().isNotEmpty;
    bool email = emailController.text.trim().isNotEmpty;
    bool password = passwordController.text.trim().isNotEmpty;
    bool confirmPassword = confirmPasswordController.text.trim().isNotEmpty;

    if (firstName && surName && email && password && confirmPassword) {
      if (passwordController.text.trim() !=
          confirmPasswordController.text.trim()) {
        return;
      }
      context.read<UserCubit>().submitSignUp(
          user: UserEntity(
              firstName: firstNameController.text.trim(),
              surName: surNameController.text.trim(),
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              role: "member"));
    }
  }

  void clearText() {
    firstNameController.clear();
    surNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }
}
