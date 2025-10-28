import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/constants/app_strings.dart';

part 'forget_passward_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  Future<void> sendCode(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      emit(ForgetPasswordError(AppStrings.emptyPhoneError));
      return;
    }

    emit(ForgetPasswordLoading());

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+20$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) {
          emit(ForgetPasswordSuccess(autoVerified: true));
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(ForgetPasswordError(e.message ?? AppStrings.verificationFailed));
        },
        codeSent: (String verificationId, int? resendToken) {
          emit(ForgetPasswordCodeSent(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(ForgetPasswordError("${AppStrings.unexpectedError}: $e"));
    }
  }
}
