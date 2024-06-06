class LoginEvent{}

class TriggerSignInButton extends LoginEvent{
  final String email;
  final String password;
  TriggerSignInButton({required this.email, required this.password});
}


class TriggerOnChangedField extends LoginEvent{
  final String email;
  TriggerOnChangedField({required this.email});
}

class TriggerPasswordOnChangedField extends LoginEvent{
  final String password;
  TriggerPasswordOnChangedField({required this.password});
}