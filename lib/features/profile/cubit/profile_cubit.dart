import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/services/firestor_user.dart';
import 'package:nha_228/core/services/hive_service.dart';
import 'package:nha_228/features/auth/models/user_model.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  UserModel? userModel;

  Future<void> loadUser() async {
    userModel = HiveManager().getUser();
    if (userModel != null) {
      emit(ProfileLoaded(userModel: userModel!));
    } else {
      emit(ProfileError(error: "Failed to load user data"));
    }
  }

  Future<void> updateUserProfile(UserModel updatedUser) async {
    emit(ProfileLoading());
    try {
      emit(ProfileUpdated(userModel: userModel!));
      await FirestorUser().addUser(updatedUser);
      await HiveManager().saveUser(updatedUser);
      userModel = updatedUser;
      emit(ProfileUpdated(userModel: updatedUser));
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(ProfileLoading());
    try {
      await FirebaseAuth.instance.signOut();
      await HiveManager().clearUser();
      await HiveManager().setBool('isLoggedIn', false);
      userModel = null;
      emit(ProfileLoggedOut());
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }
}
