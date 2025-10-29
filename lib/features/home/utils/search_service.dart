import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nha_228/features/home/models/material_model.dart';

class SearchService {
  CollectionReference materials = FirebaseFirestore.instance.collection('materials');
  Future<List<MaterialModel>> searchMaterialsByType(String materialType) async {
    QuerySnapshot querySnapshot = await materials
        .where('materialType', isGreaterThanOrEqualTo: materialType)
        .get();
    return querySnapshot.docs.map((doc)=>MaterialModel.fromMap(doc.data() as Map<String,dynamic>)).toList();
       
  }
}