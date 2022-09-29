
abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInValideState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errormsg;
  SignInErrorState({
    required this.errormsg,
  });
}

class SignInLoadingState extends SignInState {}
