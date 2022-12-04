import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodbye_money/Exception/exception.dart';
import 'package:goodbye_money/auth/auth_servicces.dart';
import 'package:goodbye_money/firebase_options.dart';

import '../routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              
                Form(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 110),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            labelText: "E-Mail",
                            hintText: "E-Mail",
                            border: OutlineInputBorder(),
                          ),
                          controller: _email,
                          obscureText: false,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            labelText: "Password",
                            hintText: "Password",
                            border: OutlineInputBorder(),
                          ),
                          controller: _password,
                          obscureText: true,
                          autocorrect: false,
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final email = _email.text;
                              final password = _password.text;
                              await Firebase.initializeApp(
                                options: DefaultFirebaseOptions.currentPlatform,
                              );
                              try {
                                await AuthServices.firebase().logIn(
                                  email: email,
                                  password: password,
                                );
                                final user =
                                    AuthServices.firebase().currentUser;
                                if (user?.isEmailVerified ?? false) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    tabRoute,
                                    (route) => false,
                                  );
                                } else {
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    verifyemail,
                                    (route) => false,
                                  );
                                }
                              } on WrongPasswordException {
                                ("Wrong Password");
                              } on UserNotFoundException {
                                ("user not found");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.black, // background (button) color
                              foregroundColor:
                                  Colors.white, // foreground (text) color
                            ),
                            child: const Text("Login"),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  registerRoutes, (route) => false);
                            },
                            child: const Text(
                                "Don't have an account? Register here!!"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
