import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/screens/SignUp/bloc/sign_in_event.dart';
import 'package:flutter_application_1/screens/SignUp/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SigninTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState(errormsg: "Please enter valide email address!!"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState(
            errormsg: "Password must be grater than 8 digits!!"));
      } else {
        emit(SignInValideState());
      }
    });
    on<SigninButtonChangeEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
