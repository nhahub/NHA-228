import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'post_material_state.dart';

class PostMaterialCubit extends Cubit<PostMaterialState> {
  PostMaterialCubit() : super(PostMaterialState.initial());

  void selectMaterial(String type, String priceText) {
    emit(state.copyWith(materialType: type, materialPrice: priceText));
  }
  double q = 0;
  void setQuantity(q) {
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

  void resetState() {
    emit(PostMaterialState.initial());
  }

  Future<void> postMaterial() async {
    try {
      emit(state.copyWith(status: PostMaterialStatus.loading));

      if (state.materialType == null || state.location == null) {
        emit(state.copyWith(
          status: PostMaterialStatus.error,
          errorMessage: "Please fill all required fields.",
        ));
        return;
      }

      final data = {
        'materialType': state.materialType,
        'materialPrice': state.materialPrice,
        'quantity': state.quantity,
        'totalPrice': state.totalPrice,
        'location': state.location,
        'description': state.description,
        'createdAt': Timestamp.now(),
      };

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
