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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login View"),
      ),
      body: Column(
        children: <Widget>[
          CupertinoTextField(
            controller: _email,
            obscureText: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
          ),
          CupertinoTextField(
            controller: _password,
            obscureText: true,
            autocorrect: false,
          ),
          TextButton(
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
                final user = AuthServices.firebase().currentUser;
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
                print("user not found");
              }
            },
            child: const Text("login"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoutes, (route) => false);
            },
            child: const Text("Don't have an account? Register here!!"),
          )
        ],
      ),
    );
  }
}
