import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goodbye_money/Exception/exception.dart';
import 'package:goodbye_money/auth/auth_servicces.dart';
import 'package:goodbye_money/firebase_options.dart';
import 'package:goodbye_money/routes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        title: const Text("Register View"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            obscureText: false,
            decoration: const InputDecoration(hintText: "Enter your Email id"),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: _password,
            obscureText: true,
            autocorrect: false,
            decoration: const InputDecoration(hintText: "Enter your Password"),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              await Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
              );
              try {
                await AuthServices.firebase().createUser(
                  email: email,
                  password: password,
                );
                AuthServices.firebase().sendEmailVerification();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamed(verifyemail);
              } on WeakPasswordException {
                print("Weak Password");
              } on InvalidEmailException {
                print("Invalid email");
              } on EmailAlreadyInUseException {
                print("Email Already in use");
              }
            },
            child: const Text("Register"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoutes,
                (route) => false,
              );
            },
            child: const Text("Already Registerd? Login Here"),
          )
        ],
      ),
    );
  }
}
