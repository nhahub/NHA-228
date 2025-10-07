part of 'otp_cubit.dart';

// حالات OTP
abstract class PhoneOtpState {}

class PhoneOtpInitial extends PhoneOtpState {}

class PhoneOtpLoading extends PhoneOtpState {}

class PhoneOtpCodeSent extends PhoneOtpState {
  final String verificationId;
  PhoneOtpCodeSent(this.verificationId);
}

class PhoneOtpVerified extends PhoneOtpState {}

class PhoneOtpError extends PhoneOtpState {
  final String message;
  PhoneOtpError(this.message);
}

