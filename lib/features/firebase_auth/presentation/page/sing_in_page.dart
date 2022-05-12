import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadium_app/core/utils/constants.dart';
import 'package:stadium_app/features/firebase_auth/domain/entities/user_entity.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/user/user_cubit.dart';
import 'package:stadium_app/features/home/presentation/pages/home_page.dart';
import 'package:stadium_app/widget/base_widget/email_input.dart';
// import 'package:stadium_app/widget/base_widget/snack_bar_error.dart';

import '../../../../../widget/base_widget/password_input.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // final GlobalKey<ScaffoldState> _scaffoldGlobalKey =
  //     GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldGlobalKey,
      backgroundColor: Colors.white,
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, userState) {
          if (userState is UserSuccess) {
            context.read<AuthCubit>().loggedIn();
          }
          if (userState is UserFailure) {
            // snackBarError(
            //     msg: "Invalid email", scaffoldState: _scaffoldGlobalKey);
          }
        },
        builder: (context, userState) {
          if (userState is UserLoading) {
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 10.0),
                    Text(
                      'ກຳລັງໂຫລດ',
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  ],
                ),
              );
          } else if (userState is UserSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return const HomePage();
                } else {
                  return  _bodyWidget();
                }
              },
            );
          }

          return _bodyWidget();
        },
      ),
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //logo app
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              const SizedBox(height: 25.0),

              //app name
              const Text(
                'ແອັບຈອງເດີ່ນເຕະບານ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
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
              const SizedBox(height: 10.0),

              //reset password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.pushNamedAndRemoveUntil(
                            context, FORGOT_PASSWORD_ROUTE, (route) => false)
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),

              //login button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: GestureDetector(
                  onTap: () => {
                    submitSignIn(),
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
                        'Sign In',
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

              //not a member? register now
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamedAndRemoveUntil(
                          context, SIGN_UP_ROUTE, (route) => false),
                    },
                    child: const Text(
                      ' Register now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitSignIn() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      context.read<UserCubit>().submitSignIn(
              user: UserEntity(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          ));
    }
  }

  void clearText() {
    emailController.clear();
    passwordController.clear();
  }
}
