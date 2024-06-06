import 'package:equatable/equatable.dart';

enum LoginStatus{
  authenticated,
  unauthenticated,
  loading
}
class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final String emailError;
  final String passwordError;
  final bool isEmailValid;
  final bool isPasswordValid;

  LoginState({
    this.email = "",
    this.password = "",
    this.status = LoginStatus.unauthenticated,
    this.emailError = "",
    this.passwordError = "",
    this.isEmailValid = false,
    this.isPasswordValid = false,
  });

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? emailError,
    String? passwordError,
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }

  @override
  List<Object?> get props =>
      [email, password, status, emailError, passwordError, isEmailValid, isPasswordValid];
}
