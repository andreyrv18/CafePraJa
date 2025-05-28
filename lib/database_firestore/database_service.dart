import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCategorias() async {
    QuerySnapshot querySnapshot = await _db.collection("cardapio").get();
    final allData =
        querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          data["id"] = doc.id;
          return data;
        }).toList();
    return allData;
  }

  Future<List<Map<String, dynamic>>> getCardapioCompleto() async {
    List<Map<String, dynamic>> cardapioCompleto = [];

    QuerySnapshot cardapioSnapshot = await _db.collection("cardapio").get();
    for (QueryDocumentSnapshot cardapioDoc in cardapioSnapshot.docs) {
      Map<String, dynamic> categoriaData =
          cardapioDoc.data() as Map<String, dynamic>;
      categoriaData["id"] = cardapioDoc.id;
      List<Map<String, dynamic>> itensDaCategoria = [];

      QuerySnapshot itensSnapshot =
          await _db
              .collection("cardapio")
              .doc(cardapioDoc.id)
              .collection("itens")
              .get();
      for (QueryDocumentSnapshot itemDoc in itensSnapshot.docs) {
        Map<String, dynamic> itemData = itemDoc.data() as Map<String, dynamic>;
        itemData['id'] = itemDoc.id;
        itensDaCategoria.add(itemData);
      }

      categoriaData['itens'] = itensDaCategoria;

      cardapioCompleto.add(categoriaData);
    }
    print(cardapioCompleto);
    return cardapioCompleto;
  }

  Future createCart() async {
    var item = "café";
    var lista = {"produto": item};
    _db
        .collection("usuario")
        .doc("lista compra")
        .set(lista)
        .onError(
          (handleError, _) => print("Error writing document: $handleError"),
        );
  }
}
