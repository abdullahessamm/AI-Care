import 'package:ai_care/core/constants/app_color.dart';
import 'package:ai_care/presentation/pages/auth_view/login_page.dart';
import 'package:ai_care/presentation/pages/auth_view/signup_page.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => AuthViewState();
}

class AuthViewState extends State<AuthView> {
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // background
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.50,
          decoration: const BoxDecoration(
            color: AppColors.primary,
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _currentScreen == 0 ? LoginPage() : SignupPage(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_currentScreen == 0
                        ? "Don't have an account?"
                        : "Already have an account?"),
                    SizedBox(
                      width: 7,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          // toggle the current screen between 0 and 1
                          _currentScreen = (_currentScreen + 1) % 2;
                        });
                      },
                      child: Text(
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold),
                          _currentScreen == 0 ? "Sign Up" : "Login"),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
