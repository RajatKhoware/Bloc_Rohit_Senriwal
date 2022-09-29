import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Connected !!"),
                  backgroundColor: Colors.green,
                ));
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Disconnected !!"),
                  backgroundColor: Colors.red,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Loading"),
                  backgroundColor: Colors.yellow,
                ));
              }
            },
            builder: (context, state) {
              if (state == InternetState.Gained) {
                return const Text("Connected");
              } else if (state == InternetState.Lost) {
                return const Text("No Internet !!");
              } else {
                return const Text("Loading");
              }
            },
          ),
        ),
      ),
    );
  }
}