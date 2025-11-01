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
      String formattedPhone = _formatPhoneNumber(phoneNumber);

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: formattedPhone,
        verificationCompleted: (PhoneAuthCredential credential) {
          emit(ForgetPasswordSuccess(autoVerified: true));
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(ForgetPasswordError(e.message ?? AppStrings.verificationFailed));
        },
        codeSent: (String verificationId, int? resendToken) {
          emit(ForgetPasswordCodeSent(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          emit(ForgetPasswordError(AppStrings.codeTimeout));
        },
      );
    } catch (e) {
      emit(ForgetPasswordError("${AppStrings.unexpectedError}: $e"));
    }
  }

  String _formatPhoneNumber(String phoneNumber) {
    String formatted = phoneNumber.trim();
    if (formatted.startsWith('+')) {
      return formatted;
    } else if (formatted.startsWith('0')) {
      return '+20${formatted.substring(1)}';
    } else {
      return '+20$formatted';
    }
  }
}
