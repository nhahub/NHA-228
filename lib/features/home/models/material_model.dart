import 'package:cloud_firestore/cloud_firestore.dart';

class MaterialModel {
  final String materialType;
  final String materialPrice;
  final double quantity;
  final double totalPrice;
  final String location;
  final String description;
  final String? imageUrl;
  final String whatsappNumber;
  final String date;
  final String time;
  final Timestamp createdAt;

  MaterialModel({
    required this.materialType,
    required this.materialPrice,
    required this.quantity,
    required this.totalPrice,
    required this.location,
    required this.description,
    this.imageUrl,
    required this.whatsappNumber,
    required this.date,
    required this.time,
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
      whatsappNumber: map['whatsappNumber'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
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
      'whatsappNumber': whatsappNumber,
      'date': date,
      'time': time,
      'createdAt': createdAt,
    };
  }
}
