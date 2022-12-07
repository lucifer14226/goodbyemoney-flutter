import 'package:flutter/material.dart';
import 'package:goodbye_money/auth/auth_servicces.dart';
import 'package:goodbye_money/routes.dart';

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
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 170,
            ),
            const Text(
              "\t\tWe have sent email on your Email-Id, \nPlease verify the link.",
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "If you haven't recieved a verification\n email yet, press the button below",
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            Card(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      await AuthServices.firebase().sendEmailVerification();
                    },
                    child: const Text('Send Email Verificaation'),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoutes,
                        (route) => false,
                      );
                    },
                    child: const Text("Go Back"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
