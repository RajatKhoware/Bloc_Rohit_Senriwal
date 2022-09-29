import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/SignUp/signup_screen.dart';
import 'package:flutter_application_1/screens/Welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScren(),
      initialRoute: '/',
      routes: {
        //'/register': (context) => const SignUpStart(),
        '/welcome': ((context) => const WelcomeScren()),
        '/sign-up': (context) => SignUpScreen(),
      },
    );
  }
}
