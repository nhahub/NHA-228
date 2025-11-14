import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nha_228/features/home/models/material_model.dart';

class SearchService {
  CollectionReference materials = FirebaseFirestore.instance.collection('materials');
  Future<List<MaterialModel>> searchMaterialsByType(String query) async {
    final search = query.trim();
    QuerySnapshot materialSnapshot =
        await materials.where('materialType', isGreaterThanOrEqualTo: search).get();
    QuerySnapshot descriptionSnapshot =
        await materials.where('description', isGreaterThanOrEqualTo: search).get();
    QuerySnapshot locationSnapshot =
        await materials.where('location', isEqualTo: search).get();
    final searchResults = {
      for (var doc in [
        ...materialSnapshot.docs,
        ...descriptionSnapshot.docs,
        ...locationSnapshot.docs,
      ])
        doc.id: doc.data(),
    };
    return searchResults.values
        .map((doc) => MaterialModel.fromMap(doc as Map<String, dynamic>))
        .toList();
  }
}
