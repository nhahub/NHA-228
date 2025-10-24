part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel userModel;
  ProfileLoaded({required this.userModel});
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError({required this.error});
}

class ProfileUpdated extends ProfileState {
  final UserModel userModel;
  ProfileUpdated({required this.userModel});
}

class ProfileLoggedOut extends ProfileState {}
