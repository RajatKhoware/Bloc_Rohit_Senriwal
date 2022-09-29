import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/SignUp/bloc/sign_in_bloc.dart';
import 'package:flutter_application_1/screens/SignUp/bloc/sign_in_event.dart';
import 'package:flutter_application_1/screens/SignUp/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errormsg,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SigninTextChangeEvent(
                          emailValue: emailController.text,
                          passwordValue: passwordController.text));
                },
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SigninTextChangeEvent(
                          emailValue: emailController.text,
                          passwordValue: passwordController.text));
                },
                decoration: const InputDecoration(hintText: "Password"),
              ),
              const SizedBox(height: 15),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return InkWell(
                    onTap: () {
                      if (state is SignInValideState) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SigninButtonChangeEvent(
                                email: emailController.text,
                                password: passwordController.text));
                      }
                    },
                    child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: (state is SignInValideState)
                            ? Colors.blue
                            : Colors.grey[500],
                      ),
                      child: const Center(child: Text("Login")),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
