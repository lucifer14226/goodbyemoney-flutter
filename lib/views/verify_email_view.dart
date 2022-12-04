import 'package:flutter/material.dart';
import 'package:goodbye_money/auth/auth_servicces.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Verify Email"),
        ),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
                "We have sent email on your email id please verify the link"),
            const Text(
                "if you haven't recieved a verification email yet, press the button below"),
            TextButton(
              onPressed: () async {
                await AuthServices.firebase().sendEmailVerification();
              },
              child: const Text('Send EmailVerificaation'),
            ),
            TextButton(
              onPressed: () async {
                await AuthServices.firebase().logOut();
              },
              child: const Text("Restart"),
            )
          ],
        ),
      ),
    );
  }
}
