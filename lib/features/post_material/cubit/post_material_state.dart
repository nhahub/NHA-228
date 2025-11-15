part of 'post_material_cubit.dart';

enum PostMaterialStatus { initial, loading, success, error }

class PostMaterialState {
  final String? materialType;
  final String? materialPrice;
  final double? quantity;
  final double? totalPrice;
  final String? location;
  final String? description;
  final String? whatsAppNamber;
  final PostMaterialStatus status;
  final String? errorMessage;
  final String? date;
  final String? time;

  PostMaterialState({
    this.materialType,
    this.materialPrice,
    this.quantity,
    this.totalPrice,
    this.location,
    this.description,
    this.whatsAppNamber,
    this.status = PostMaterialStatus.initial,
    this.errorMessage,
    this.date,
    this.time,
  });

  factory PostMaterialState.initial() => PostMaterialState(
    materialType: null,
    materialPrice: null,
    quantity: null,
    totalPrice: null,
    location: null,
    description: null,
    whatsAppNamber: null,
    status: PostMaterialStatus.initial,
    errorMessage: null,
    date: null,
    time: null,
  );

  PostMaterialState copyWith({
    String? materialType,
    String? materialPrice,
    double? quantity,
    double? totalPrice,
    String? location,
    String? description,
    String? whatsAppNamber,
    PostMaterialStatus? status,
    String? errorMessage,
    String? date,
    String? time,
  }) {
    return PostMaterialState(
      materialType: materialType ?? this.materialType,
      materialPrice: materialPrice ?? this.materialPrice,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      location: location ?? this.location,
      description: description ?? this.description,
      whatsAppNamber: whatsAppNamber ?? this.whatsAppNamber,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }
}
