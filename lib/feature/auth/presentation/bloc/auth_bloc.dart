import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_market/feature/auth/presentation/bloc/auth_event.dart';
import 'package:one_market/feature/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(signUp);
    on<SignInEvent>(signIn);
    on<ForgetPasswordEvent>(forgetPassword);
  }

  var userCredential;

  signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(SignUpLoadingState());
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      User user = userCredential.user!;
      user.updateDisplayName(event.name);
      //AppLocalStorage.cacheData(key: AppLocalStorage.token, value: user.uid);
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState('كلمة المرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState('البريد الإلكتروني مستخدم بالفعل'));
      }
    } catch (e) {
      emit(AuthErrorState('حدث خطأ ما'));
    }
  }

  signIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(SignInLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      // User user = userCredential.user!;
      //AppLocalStorage.cacheData(key: AppLocalStorage.token, value: user.uid);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState('الحساب غير موجود'));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState('كلمة المرور غير صحيحة'));
      }
    } catch (e) {
      emit(AuthErrorState('حدث خطأ ما'));
    }
  }

  forgetPassword(ForgetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(ForgetPasswordLoadingState());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: event.email,
      );

      emit(ForgetPasswordSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState('البريد الإلكتروني ليس مسجل به حساب'));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState('كلمة المرور غير صحيحة'));
      }
    } catch (e) {
      emit(AuthErrorState('حدث خطأ ما'));
    }
  }
}
