import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_passward_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  Future<void> sendCode(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      emit(ForgetPasswordError("Please enter your phone number"));
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
          emit(ForgetPasswordError(e.message ?? "Error occurred while sending"));
        },
        codeSent: (String verificationId, int? resendToken) {
          emit(ForgetPasswordCodeSent(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(ForgetPasswordError("Unexpected error occurred: $e"));
    }
  }
}
