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
                            labelText: "Enter your Email-Id",
                            hintText: "Enter your Email-Id",
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
                            labelText: "Enter your Password",
                            hintText: "Enter your Password",
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.black, // background (button) color
                              foregroundColor:
                                  Colors.white, // foreground (text) color
                            ),
                            child: const Text("Register"),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                loginRoutes,
                                (route) => false,
                              );
                            },
                            child: const Text("Already Registerd? Login Here"),
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
