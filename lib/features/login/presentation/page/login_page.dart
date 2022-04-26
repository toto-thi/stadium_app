import 'package:flutter/material.dart';
import 'package:stadium_app/core/utils/constants.dart';

import '../../../../widget/base_widget/email_input.dart';
import '../../../../widget/base_widget/password_input.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green.shade400,
      body: Center(
        child: Container(
          // margin: const EdgeInsets.only(left: 10, right: 10),
          height: 500,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // to stretch widget to it's full Y alignment
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                ),
                const SizedBox(height: 18),
                EmailInputField(controller: emailController),
                const SizedBox(height: 18),
                PasswordInputField(controller: passwordController),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HOME_ROUTE, (r) => false)
                  },
                  child: const Text('Sign In'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50.0),
                    textStyle: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 18),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'No account yet? ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                          onPressed: () => {
                            
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
