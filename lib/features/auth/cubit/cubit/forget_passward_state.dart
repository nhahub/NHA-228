part of 'forget_passward_cubit.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordCodeSent extends ForgetPasswordState {
  final String verificationId;
  ForgetPasswordCodeSent(this.verificationId);
}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final bool autoVerified;
  ForgetPasswordSuccess({this.autoVerified = false});
}

class ForgetPasswordError extends ForgetPasswordState {
  final String message;
  ForgetPasswordError(this.message);
}
