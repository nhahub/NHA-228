import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/home_constants/category_values.dart';
part 'post_material_state.dart';

class PostMaterialCubit extends Cubit<PostMaterialState> {
  PostMaterialCubit() : super(PostMaterialState.initial());

  File? imageFile;

  void setImage(File file) {
    imageFile = file;
    if (!isClosed) {
      emit(state.copyWith(imagePath: file.path));
    }
  }

  void selectMaterial(String type, String priceText) {
    final wasteItem = CategoryValues.wasteItems.firstWhere(
      (item) => item.title.toLowerCase() == type.toLowerCase(),
      orElse: () => CategoryValues.wasteItems.first,
    );

    if (!isClosed) {
      emit(
        state.copyWith(
          materialType: type,
          materialPrice: priceText,
          imagePath: wasteItem.imagePath,
        ),
      );
    }
  }

  void setQuantity(double q) {
    double? total;
    if (state.materialPrice != null) {
      final pricePerKg = double.tryParse(state.materialPrice!.split(" ").first);
      if (pricePerKg != null) total = pricePerKg * q;
    }
    if (!isClosed) {
      emit(state.copyWith(quantity: q, totalPrice: total));
    }
  }

  void setLocation(String val) {
    if (!isClosed) {
      emit(state.copyWith(location: val));
    }
  }

  void setDescription(String val) {
    if (!isClosed) {
      emit(state.copyWith(description: val));
    }
  }

  void setWhatsAppNumber(String val) {
    if (!isClosed) {
      emit(state.copyWith(whatsappNumber: val));
    }
  }

  void setDate(String val) {
    if (!isClosed) {
      emit(state.copyWith(date: val));
    }
  }

  void setTime(String val) {
    if (!isClosed) {
      emit(state.copyWith(time: val));
    }
  }

  void resetState() {
    if (!isClosed) {
      emit(PostMaterialState.initial());
    }
  }

  Future<void> postMaterial() async {
    try {
      if (!isClosed) {
        emit(state.copyWith(status: PostMaterialStatus.loading));
      }

      if (state.materialType == null ||
          state.location == null ||
          state.description == null ||
          (state.whatsappNumber == null || state.whatsappNumber!.trim().isEmpty)) {
        if (!isClosed) {
          emit(
            state.copyWith(
              status: PostMaterialStatus.error,
              errorMessage: AppStrings.pleaseFillAllRequiredFields,
            ),
          );
        }
        return;
      }

      final data = {
        'materialType': state.materialType,
        'materialPrice': state.materialPrice,
        'quantity': state.quantity,
        'totalPrice': state.totalPrice,
        'location': state.location,
        'description': state.description,
        'whatsappNumber': state.whatsappNumber,
        'date': state.date,
        'time': state.time,
        'imageUrl': state.imagePath,
        'createdAt': Timestamp.now(),
      };

      await FirebaseFirestore.instance.collection('materials').add(data);

      if (!isClosed) {
        emit(state.copyWith(status: PostMaterialStatus.success));
      }

      resetState();
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(status: PostMaterialStatus.error, errorMessage: e.toString()),
        );
      }
    }
  }
}
