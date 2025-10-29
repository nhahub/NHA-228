import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_strings.dart';

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
  void setWhatsAppNumber(String val) {
    emit(state.copyWith(whatsAppNamber: val));
  }

  bool _validate(BuildContext context) {
    if (state.materialType == null) {
      _showError(context, "Please select the material type");
      return false;
    }

    if (state.quantity == null || state.quantity! <= 0) {
      _showError(context, "Please enter a valid quantity");
      return false;
    }

    if (state.location == null || state.location!.isEmpty) {
      _showError(context, "Please enter a location");
      return false;
    }

    if (state.description == null || state.description!.isEmpty) {
      _showError(context, "Please add a description");
      return false;
    }

    if (state.whatsAppNamber == null || state.whatsAppNamber!.isEmpty) {
      _showError(context, "Please enter your WhatsApp number");
      return false;
    }

    // Regex للتحقق من رقم الواتساب
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    if (!phoneRegex.hasMatch(state.whatsAppNamber!)) {
      _showError(context, "Invalid WhatsApp number");
      return false;
    }

    return true;
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> postMaterial(BuildContext context) async {
    if (!_validate(context)) return;

    try {
      emit(state.copyWith(status: PostMaterialStatus.loading));

      if (state.materialType == null ||
          state.location == null ||
          state.description == null) {
        emit(
          state.copyWith(
            status: PostMaterialStatus.error,
            errorMessage: AppStrings.pleaseFillAllRequiredFields,
          ),
        );
        return;
      }

      //  الصورة متعطلة مؤقتًا لأن Firebase Storage مش مفعّل
      // final fileName = 'materials_images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      // final ref = FirebaseStorage.instance.ref().child(fileName);
      // final uploadTask = await ref.putFile(imageFile!);
      // final imageUrl = await uploadTask.ref.getDownloadURL();
      
      // Placeholder image بدل التخزين الحقيقي مؤقتًا
      String imageUrl = "https://via.placeholder.com/200";

      final data = {
        'materialType': state.materialType,
        'materialPrice': state.materialPrice,
        'quantity': state.quantity,
        'totalPrice': state.totalPrice,
        'location': state.location,
        'description': state.description,
        'whatsAppNumber': state.whatsAppNamber,
        'imageUrl': imageUrl,
        'createdAt': Timestamp.now(),
      };

      await FirebaseFirestore.instance.collection('materials').add(data);

      emit(state.copyWith(status: PostMaterialStatus.success));
      resetState();
    } catch (e) {
      emit(state.copyWith(status: PostMaterialStatus.error, errorMessage: e.toString()));
    }
  }

  void resetState() {
    emit(PostMaterialState.initial());
    imageFile = null;
  }
}
