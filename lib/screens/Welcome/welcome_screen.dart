import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/SignUp/bloc/sign_in_bloc.dart';
import 'package:flutter_application_1/screens/SignUp/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScren extends StatelessWidget {
  const WelcomeScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 210),
            const Text("Welcome"),
            const SizedBox(height: 200),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => SignInBloc(),
                              child:  SignUpScreen(),
                            )));
              },
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.orange[900],
                ),
                child: const Center(child: Text("Signup")),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.orange[900],
              ),
              child: const Center(child: Text("Login")),
            )
          ],
        ),
      ),
    );
  }
}
