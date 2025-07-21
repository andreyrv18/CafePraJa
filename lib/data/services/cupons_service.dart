import 'package:cloud_firestore/cloud_firestore.dart';

class CuponsService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getTodosCupons() {
    Stream<QuerySnapshot<Map<String, dynamic>>> cuponsStream =
    _db.collection('cupons').snapshots();
    return cuponsStream;
  }
}