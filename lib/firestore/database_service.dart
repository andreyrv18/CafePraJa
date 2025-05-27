import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> create() async {
    final cities = _db.collection("cities");
    final data1 = <String, dynamic>{
      "name": "San Francisco",
      "state": "CA",
      "country": "USA",
      "capital": false,
      "population": 860000,
      "regions": ["west_coast", "norcal"],
    };
    await cities.doc("SF").set(data1);
  }

  Future<List<Map<String, dynamic>>> getCardapio() async {
    QuerySnapshot querySnapshot = await _db.collection("cardapio").get();
    final allData =
        querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          data["id"] = doc.id;
          return data;
        }).toList();
    return allData;
  }

  Future<void> received() async {
    final docRef = _db.collection("cities").doc("SF");
    docRef.get().then((DocumentSnapshot doc) {
      return doc.data() as Map<String, dynamic>;
    }, onError: (e) => print("Error getting document: $e"));
  }
}
