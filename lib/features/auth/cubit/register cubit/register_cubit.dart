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
  }) async {
    emit(RegisterLoading());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
        uid: userCredential.user!.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
      await HiveManager().saveUser(userModel);
      await FirestoreUser().addUser(userModel);

      emit(RegisterSuccess(userCredential.user));
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(e.message ?? "opps! something went wrong"));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
