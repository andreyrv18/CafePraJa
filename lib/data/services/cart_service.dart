import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CartService {
  CartService({this.uid});

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String? uid; // UID do usuário logado

  Future createCart(
    String idDoProduto,
    nomeProduto,
    precoUnitario,
    imagemUrl,
  ) async {
    DocumentReference itemRef = _db
        .collection('usuarios')
        .doc(uid)
        .collection('carrinhoItens')
        .doc(idDoProduto);

    DocumentSnapshot docSnapshot = await itemRef.get();
    if (docSnapshot.exists) {
      await itemRef.update({'quantidade': FieldValue.increment(1)});
    } else {
      Map<String, dynamic> novoItemData = {
        'nomeProduto': nomeProduto,
        'precoUnitario': precoUnitario,
        'quantidade': 1,
        'imagemUrl': imagemUrl,
        'adicionadoEm': FieldValue.serverTimestamp(),
      };
      await itemRef.set(novoItemData);
    }
  }

  Future<void> addOrUpdateItemNoCarrinho(
    String idProduto,
    String nomeProduto,
    double precoUnitario,
    String categoriaId,
    String imagemUrl,
    String descricao,
  ) async {
    if (uid == null) throw Exception(CafeString.usuarioNaoAutenticado);
    final DocumentReference itemRef = _db
        .collection('usuarios')
        .doc(uid)
        .collection('carrinhoItens')
        .doc(idProduto);
    await _db.runTransaction((transaction) async {
      final snapshot = await transaction.get(itemRef);
      if (snapshot.exists) {
        transaction.update(itemRef, {
          'quantidade': FieldValue.increment(1),
          'adicionadoEm': FieldValue.serverTimestamp(),
        });
      } else {
        transaction.set(itemRef, {
          'nomeProduto': nomeProduto,
          'precoUnitario': precoUnitario,
          'quantidade': 1,
          'imagemUrl': imagemUrl,
          'descricao': descricao,
          'adicionadoEm': FieldValue.serverTimestamp(),
        });
      }
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCartItemsStream() {
    if (uid == null) return Stream.empty();

    return _db
        .collection('usuarios')
        .doc(uid)
        .collection('carrinhoItens')
        .snapshots();
  }

  Future<void> deleteProduto(String idDoProduto) async {
    try {
      DocumentReference itemRef = _db
          .collection('usuarios')
          .doc(uid)
          .collection('carrinhoItens')
          .doc(idDoProduto);

      await itemRef.delete();
    } on Exception catch (e) {
      debugPrint('${CafeString.erroAoDeletar}: $e');
    }
  }

  Future<void> atualizaQuantidadeNoCarrinho(
    String idProduto,
    int novaQuantidade,
  ) async {
    DocumentReference itemRef = _db
        .collection('usuarios')
        .doc(uid)
        .collection('carrinhoItens')
        .doc(idProduto);

    if (novaQuantidade <= 0) {
      itemRef.delete();
    } else {
      await itemRef.update({
        'quantidade': novaQuantidade,
        'adicionadoEm': FieldValue.serverTimestamp(),
      });
    }
  }
}
