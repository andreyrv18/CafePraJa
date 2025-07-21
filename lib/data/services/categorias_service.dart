import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriasService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCategorias() async {
    QuerySnapshot querySnapshot = await _db.collection('cardapio').get();
    final allData =
    querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return data;
    }).toList();
    return allData;
  }


}