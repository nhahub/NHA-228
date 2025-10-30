import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/services/firestor_user.dart';
import 'package:nha_228/core/services/hive_service.dart';
import 'package:nha_228/features/auth/models/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    emit(RegisterLoading());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName("$firstName $lastName");
      UserModel userModel = UserModel(
        uid: userCredential.user!.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );
      await HiveManager().saveUser(userModel);
      await FirestorUser().addUser(userModel);

      emit(RegisterSuccess(userCredential.user));
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = "email-already-in-use";
          break;
        case 'weak-password':
          errorMessage = "weak-password";
          break;
        case 'invalid-email':
          errorMessage = "invalid-email";
          break;
        default:
          errorMessage = "unexpected-error";
      }
      emit(RegisterFailure(errorMessage));
    } catch (e) {
      emit(RegisterFailure("unexpected-error: ${e.toString()}"));
    }
  }
}
