import 'dart:async';

import 'package:cafe_pra_ja/domain/models/menu_item_model.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseRepository {
  DatabaseRepository({this.uid});

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String? uid; // UID do usuário logado

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

  Future<List<MenuItemModel>> getTodosOsItensDoCardapio() async {
    List<MenuItemModel> todosOsItens = [];
    try {
      QuerySnapshot<Map<String, dynamic>> categoriasSnapshot =
          await _db.collection('cardapio').get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> categoriaDoc
          in categoriasSnapshot.docs) {
        String categoriaId = categoriaDoc.id;
        QuerySnapshot<Map<String, dynamic>> itensSnapshot =
            await _db
                .collection('cardapio')
                .doc(categoriaId)
                .collection('itens')
                .get();
        for (QueryDocumentSnapshot<Map<String, dynamic>> itemDoc
            in itensSnapshot.docs) {
          todosOsItens.add(MenuItemModel.fromFirestore(itemDoc, categoriaId));
        }
      }
    } catch (e) {
      throw Exception('${CafeString.naoFoiPossivelCarregarOsItensDoCardapio}: $e');
    }
    return todosOsItens;
  }

  Future createCart(idDoProduto, nomeProduto, precoUnitario, imagemUrl) async {
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

  Stream<QuerySnapshot<Map<String, dynamic>>> getTodosOsCuponsStream() {
    Stream<QuerySnapshot<Map<String, dynamic>>> cuponsStream =
        _db.collection('cupons').snapshots();
    return cuponsStream;
  }
}
