import 'package:ai_care/core/constants/app_color.dart';
import 'package:ai_care/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _showPassword = false;
  bool _emailEmpty = true;
  bool _passwordEmpty = true;
  bool _googleLoginLoading = false;
  bool _emailPasswordLoginLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailController.addListener(() {
      setState(() {
        _emailEmpty = _emailController.text.isEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _passwordEmpty = _passwordController.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          _showErrorDialog(context, state);
          _passwordController.clear();
          setState(() {
            _googleLoginLoading = false;
            _emailPasswordLoginLoading = false;
          });
        }
      },
      child: Container(
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
                constraints: const BoxConstraints(maxWidth: 500),
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
                          if (_googleLoginLoading) return;

                          setState(() {
                            _googleLoginLoading = true;
                          });

                          context.read<AuthBloc>().add(LoginWithGoogleEvent());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.4)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _googleLoginLoading
                                  ? const SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        color: AppColors.primary,
                                        strokeWidth: 3,
                                      ),
                                    )
                                  : const Image(
                                      width: 25,
                                      image: AssetImage(
                                          'assets/images/google_logo.png')),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
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
                          onPressed: _emailPasswordLoginLoading ||
                                  _emailEmpty ||
                                  _passwordEmpty
                              ? null
                              : () {
                                  setState(() {
                                    _emailPasswordLoginLoading = true;
                                  });

                                  context.read<AuthBloc>().add(
                                      LoginWithEmailAndPasswordEvent(
                                          email: _emailController.text,
                                          password: _passwordController.text));
                                },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: _emailPasswordLoginLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
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
      ),
    );
  }

  void _showErrorDialog(BuildContext context, AuthError state) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: const Icon(Icons.error),
              title: const Text("Login error"),
              content: Text(state.errorMessage ??
                  "Something went wrong during logging in"),
            ));
  }
}
