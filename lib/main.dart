import 'package:goodbye_money/routes.dart';
import 'package:goodbye_money/views/login_view.dart';
import 'package:goodbye_money/views/register_view.dart';
import 'package:goodbye_money/views/verify_email_view.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:goodbye_money/tabs.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) => {
      options.dsn =
          'https://f67869e3983d4e1698f1c092bd880fb9@o1418292.ingest.sentry.io/4504078280556544',
      options.tracesSampleRate = 1.0,
      options.attachScreenshot = true,
    },
    appRunner: () => runApp(const MaterialApp(
      home: MyApp(),
    )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Expense Tracker',
      theme: const CupertinoThemeData(
          primaryColor: Color.fromARGB(255, 41, 141, 255),
          brightness: Brightness.dark),
      routes: {
        loginRoutes: (context) => const LoginView(),
        verifyemail: (context) => const VerifyEmailView(),
        registerRoutes: (context) => const RegisterView(),
        tabRoute: (context) => const TabsController()
      },
      home: const LoginView(),
    );
  }
}
