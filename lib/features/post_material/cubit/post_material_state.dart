part of 'post_material_cubit.dart';

enum PostMaterialStatus { initial, loading, success, error }

class PostMaterialState {
  final String? materialType;
  final String? materialPrice;
  final double? quantity;
  final double? totalPrice;
  final String? location;
  final String? description;
  final PostMaterialStatus status;
  final String? errorMessage;

  PostMaterialState({
    this.materialType,
    this.materialPrice,
    this.quantity,
    this.totalPrice,
    this.location,
    this.description,
    this.status = PostMaterialStatus.initial,
    this.errorMessage,
  });

  factory PostMaterialState.initial() => PostMaterialState(
        materialType: null,
        materialPrice: null,
        quantity: 0,
        totalPrice: 0,
        location: '',
        description: '',
        status: PostMaterialStatus.initial,
        errorMessage: null,
      );

  PostMaterialState copyWith({
    String? materialType,
    String? materialPrice,
    double? quantity,
    double? totalPrice,
    String? location,
    String? description,
    PostMaterialStatus? status,
    String? errorMessage,
  }) {
    return PostMaterialState(
      materialType: materialType ?? this.materialType,
      materialPrice: materialPrice ?? this.materialPrice,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      location: location ?? this.location,
      description: description ?? this.description,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
