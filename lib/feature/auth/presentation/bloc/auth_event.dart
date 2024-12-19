class AuthEvent {}

// Sign In

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  SignInEvent({
    required this.email,
    required this.password,
  });
}

// Sign Up

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

// Forget Password

class ForgetPasswordEvent extends AuthEvent {
  final String email;
  ForgetPasswordEvent({required this.email});
}
