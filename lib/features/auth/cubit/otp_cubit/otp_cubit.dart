import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nha_228/core/constants/app_strings.dart';
part 'otp_state.dart';

class PhoneOtpCubit extends Cubit<PhoneOtpState> {
  PhoneOtpCubit() : super(PhoneOtpInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  Future<void> sendOtp(String phoneNumber) async {
    emit(PhoneOtpLoading());
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          emit(PhoneOtpVerified());
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(PhoneOtpError(e.message ?? AppStrings.phoneVerificationFailed));
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          emit(PhoneOtpCodeSent(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      emit(PhoneOtpError(AppStrings.failedToSendOTPTryAgain));
    }
  }

  Future<void> verifyOtp(String smsCode) async {
    if (_verificationId == null) {
      emit(PhoneOtpError(AppStrings.noVerificationIDPleaseRequestANewCode));
      return;
    }
    emit(PhoneOtpLoading());
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      emit(PhoneOtpVerified());
    } catch (e) {
      emit(PhoneOtpError(AppStrings.incorrectCode));
    }
  }
}
