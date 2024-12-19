class AuthState {}

class AuthInitial extends AuthState {}

// Sign In

class SignInSuccessState extends AuthState {}

class SignInLoadingState extends AuthState {}

// Sign Up

class SignUpSuccessState extends AuthState {}

class SignUpLoadingState extends AuthState {}

// Forget Password

class ForgetPasswordSuccessState extends AuthState {}

class ForgetPasswordLoadingState extends AuthState {}

// Auth Error

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
