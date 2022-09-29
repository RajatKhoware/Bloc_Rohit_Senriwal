// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInEvent {}

class SigninTextChangeEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SigninTextChangeEvent({
   required this.emailValue,
    required this.passwordValue,
  });
}

class SigninButtonChangeEvent extends SignInEvent {
  final String email;
  final String password;
  SigninButtonChangeEvent({
   required this.email,
   required this.password,
  });
}
