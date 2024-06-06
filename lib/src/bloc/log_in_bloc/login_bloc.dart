import 'dart:async';

import 'package:fashion_finds/src/bloc/log_in_bloc/login_event.dart';
import 'package:fashion_finds/src/bloc/log_in_bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<TriggerSignInButton>(loginUser);
    on<TriggerOnChangedField>(checkEmailTextField);
    on<TriggerPasswordOnChangedField>(checkPasswordTextField);
  }

  void checkEmailTextField(TriggerOnChangedField event, Emitter<LoginState> emit) {
    bool isValid = event.email.isNotEmpty && RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(event.email);
    emit(state.copyWith(
      email: event.email,
      emailError: isValid ? "" : "Invalid email format",
      isEmailValid: isValid,
    ));
  }

  void checkPasswordTextField(TriggerPasswordOnChangedField event, Emitter<LoginState> emit) {
    bool isValid = event.password.isNotEmpty && event.password.length >= 6;
    emit(state.copyWith(
      password: event.password,
      passwordError: isValid ? "" : "Password must be at least 6 characters",
      isPasswordValid: isValid,
    ));
  }

  Future<void> loginUser(TriggerSignInButton event, Emitter<LoginState> emit) async {
    bool isEmailValid = event.email.isNotEmpty && RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(event.email);
    bool isPasswordValid = event.password.isNotEmpty && event.password.length >= 6;

    if (!isEmailValid || !isPasswordValid) {
      emit(state.copyWith(
        emailError: !isEmailValid ? "Invalid email format" : "",
        passwordError: !isPasswordValid ? "Password must be at least 6 characters" : "",
        isEmailValid: isEmailValid,
        isPasswordValid: isPasswordValid,
      ));
    } else {
      emit(state.copyWith(status: LoginStatus.loading));
      await Future.delayed(Duration(milliseconds: 4000)); // Await the delay
      emit(state.copyWith(status: LoginStatus.authenticated));
    }
  }
}
