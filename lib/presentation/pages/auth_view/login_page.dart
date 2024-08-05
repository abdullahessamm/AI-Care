import 'package:ai_care/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
                width: 50,
                height: 50,
                child:
                    Image(image: AssetImage('assets/images/logo_white.png'))),
            // title
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.80),
              child: const Column(
                children: [
                  Text(
                    "Sign in to your",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      fontFamily: 'Tahoma',
                    ),
                  ),
                  Text(
                    "Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Enter your email and password to log in",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            // form
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                    )
                  ]),
              child: Column(
                children: [
                  // google button
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: InkWell(
                      onTap: () {
                        // TODO: handle google login
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.4)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                width: 25,
                                image: AssetImage(
                                    'assets/images/google_logo.png')),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Continue with Google",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // divider
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.grey.withOpacity(0.3)),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            "Or",
                            style: TextStyle(color: Color(0xff777777)),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey.withOpacity(0.3)),
                        ),
                      ],
                    ),
                  ),
                  // email input
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                              hintText: "Your email",
                              hintStyle: TextStyle(color: Color(0xffaaaaaa)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.primary),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFe1e1e1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // password input
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: !_showPassword,
                          obscuringCharacter: "*",
                          keyboardType: TextInputType.visiblePassword,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              hintText: "Your password",
                              hintStyle:
                                  const TextStyle(color: Color(0xffaaaaaa)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.primary),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFe1e1e1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  icon: Icon(
                                    _showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color(0xffaaaaaa),
                                  ))),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // login button
                  Container(
                    padding: const EdgeInsets.only(top: 15.0),
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          // TODO validate form and handle login logic
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ),
                  // forgot password link
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: InkWell(
                      onTap: () {
                        // TODO navigate to forgot password screen
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            // underline decoration
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
