import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'forget_passward_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  Future<void> sendResetEmail(String email) async {
    emit(ForgetPasswordLoading());

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      emit(ForgetPasswordSuccess("Password reset email sent"));
    } catch (e) {
      emit(ForgetPasswordError(e.toString()));
    }
  }
}
