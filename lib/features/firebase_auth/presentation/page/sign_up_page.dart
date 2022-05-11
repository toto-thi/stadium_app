import 'package:flutter/material.dart';
import 'package:stadium_app/widget/base_widget/email_input.dart';
import 'package:stadium_app/widget/base_widget/password_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //logo app
                Image.asset(
                  'assets/images/logo.png',
                  height: 75,
                ),
                const SizedBox(height: 50.0),

                //app name
                const Text(
                  'ແອັບຈອງເດີ່ນເຕະບານ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
                  child: PasswordInputField(controller: passwordController),
                ),
                const SizedBox(height: 20.0),

                //login button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: GestureDetector(
                    onTap: () => {
                      // context.read<AuthenticationService>().signIn(
                      //       email: emailController.text.trim(),
                      //       password: passwordController.text.trim(),
                      //     )
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
                      onTap: ()=>{},
                      child: const Text(
                        ' Login now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
