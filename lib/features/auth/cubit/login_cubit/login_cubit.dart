import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nha_228/core/services/firestor_user.dart';
import 'package:nha_228/core/services/hive_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user != null) {
        final userModel = await FirestoreUser().getUser(user.uid);
        if (userModel != null) {
          try {
            await HiveManager().saveUser(userModel);
            emit(LoginSuccess(user: credential.user));
          } catch (e) {
            emit(LoginFailure(error: 'Failed to save user data locally'));
          }
        } else {
          emit(LoginFailure(error: 'User data not found in Firestore'));
        }
      } else {
        emit(LoginFailure(error: 'User not found'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(error: 'User not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(error: 'Wrong password'));
      } else {
        emit(LoginFailure(error: 'Email or password may be wrong'));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
