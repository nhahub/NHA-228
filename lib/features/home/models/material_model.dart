import 'package:cloud_firestore/cloud_firestore.dart';

class MaterialModel {
  final String materialType;
  final String materialPrice;
  final double quantity;
  final double totalPrice;
  final String location;
  final String description;
  final String? imageUrl;
  final Timestamp createdAt;

  MaterialModel({
    required this.materialType,
    required this.materialPrice,
    required this.quantity,
    required this.totalPrice,
    required this.location,
    required this.description,
    this.imageUrl,
    required this.createdAt,
  });

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      materialType: map['materialType'] ?? 'غير محدد',
      materialPrice: map['materialPrice'] ?? '0',
      quantity: (map['quantity'] ?? 0).toDouble(),
      totalPrice: (map['totalPrice'] ?? 0).toDouble(),
      location: map['location'] ?? 'غير محدد',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'],
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'materialType': materialType,
      'materialPrice': materialPrice,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'location': location,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }
}
