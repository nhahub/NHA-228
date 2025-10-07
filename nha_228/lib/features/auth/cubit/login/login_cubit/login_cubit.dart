import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess(user: credential.user));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(error: 'User not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(error: 'Wrong password'));
      }else{
        emit(LoginFailure(error:'Email or password my be wrong'));
      }
      }
      catch (e) {
      emit(LoginFailure(error:e.toString()));
    }
    }
  }

