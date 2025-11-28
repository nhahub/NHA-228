part of 'post_material_cubit.dart';

enum PostMaterialStatus { initial, loading, success, error }

class PostMaterialState {
  final String? materialType;
  final String? materialPrice;
  final double? quantity;
  final double? totalPrice;
  final String? location;
  final String? description;

  final String? whatsappNumber;

  @Deprecated('Use whatsappNumber instead')
  String? get whatsAppNamber => whatsappNumber;

  final PostMaterialStatus status;
  final String? errorMessage;
  final String? date;
  final String? time;
  final String? imagePath;

  PostMaterialState({
    this.materialType,
    this.materialPrice,
    this.quantity,
    this.totalPrice,
    this.location,
    this.description,
    this.whatsappNumber,
    this.status = PostMaterialStatus.initial,
    this.errorMessage,
    this.date,
    this.time,
    this.imagePath,
  });

  factory PostMaterialState.initial() => PostMaterialState(
    materialType: null,
    materialPrice: null,
    quantity: null,
    totalPrice: null,
    location: null,
    description: null,
    whatsappNumber: null,
    status: PostMaterialStatus.initial,
    errorMessage: null,
    date: null,
    time: null,
    imagePath: null,
  );

  PostMaterialState copyWith({
    String? materialType,
    String? materialPrice,
    double? quantity,
    double? totalPrice,
    String? location,
    String? description,

    String? whatsappNumber,

    String? whatsAppNamber,
    PostMaterialStatus? status,
    String? errorMessage,
    String? date,
    String? time,
    String? imagePath,
  }) {
    final resolvedWhatsApp = whatsappNumber ?? whatsAppNamber;

    return PostMaterialState(
      materialType: materialType ?? this.materialType,
      materialPrice: materialPrice ?? this.materialPrice,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      location: location ?? this.location,
      description: description ?? this.description,
      whatsappNumber: resolvedWhatsApp ?? this.whatsappNumber,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      date: date ?? this.date,
      time: time ?? this.time,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
