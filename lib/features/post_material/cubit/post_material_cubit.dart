import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_material_state.dart';

class PostMaterialCubit extends Cubit<PostMaterialState> {
  PostMaterialCubit() : super(PostMaterialState.initial());

  File? imageFile;

  void selectMaterial(String type, String priceText) {
    emit(state.copyWith(materialType: type, materialPrice: priceText));
  }

  void setQuantity(double q) {
    double? total;
    if (state.materialPrice != null) {
      final pricePerKg = double.tryParse(state.materialPrice!.split(" ").first);
      if (pricePerKg != null) total = pricePerKg * q;
    }
    emit(state.copyWith(quantity: q, totalPrice: total));
  }

  void setLocation(String val) {
    emit(state.copyWith(location: val));
  }

  void setDescription(String val) {
    emit(state.copyWith(description: val));
  }

  void setImage(File file) {
    imageFile = file;
  }

  void resetState() {
    emit(PostMaterialState.initial());
    imageFile = null;
  }

  Future<void> postMaterial() async {
    try {
      emit(state.copyWith(status: PostMaterialStatus.loading));

      if (state.materialType == null ||
          state.location == null ||
          state.description == null ||
          imageFile == null) {
        emit(state.copyWith(
          status: PostMaterialStatus.error,
          errorMessage: "Please fill all required fields.",
        ));
        return;
      }

      final fileName = 'materials_images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final ref = FirebaseStorage.instance.ref().child(fileName);

      final uploadTask = await ref.putFile(imageFile!);
      final imageUrl = await uploadTask.ref.getDownloadURL();

      final data = {
        'materialType': state.materialType,
        'materialPrice': state.materialPrice,
        'quantity': state.quantity,
        'totalPrice': state.totalPrice,
        'location': state.location,
        'description': state.description,
        'imageUrl': imageUrl,
        'createdAt': Timestamp.now(),
      };

      // 🪄 3. Save to Firestore
      await FirebaseFirestore.instance.collection('materials').add(data);

      emit(state.copyWith(status: PostMaterialStatus.success));
      resetState();
    } catch (e) {
      emit(state.copyWith(
        status: PostMaterialStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
