import 'package:cafe_pra_ja/models/menu_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String? uid; // UID do usuário logado
  DatabaseService({this.uid});

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

    return cardapioCompleto;
  }

  /// Alternativa: Busca todos os itens do cardápio como uma única lista (sem agrupar por categoria no retorno).
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
      print("Erro ao buscar todos os itens do cardápio: $e");
      throw Exception("Não foi possível carregar os itens do cardápio: $e");
    }
    return todosOsItens;
  }

  Future createCart(IdDoProduto, nomeProduto, precoUnitario, imagemUrl) async {
    DocumentReference itemRef = _db
        .collection("usuarios")
        .doc(uid)
        .collection("carrinhoItens")
        .doc(IdDoProduto);

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
    String? imagemUrl,
  ) async {
    if (uid == null) throw Exception("Usuário não autenticado.");
    final DocumentReference itemRef = _db
        .collection("usuarios")
        .doc(uid)
        .collection('carrinhoItens')
        .doc(idProduto);
    await _db.runTransaction((transaction) async {
      final snapshot = await transaction.get(itemRef);
      if (snapshot.exists) {
        transaction.update(itemRef, {
          "quantidade": FieldValue.increment(1),
          'adicionadoEm': FieldValue.serverTimestamp(),
        });
      } else {
        transaction.set(itemRef, {
          'nomeProduto': nomeProduto,
          'precoUnitario': precoUnitario,
          'quantidade': 1,
          'imagemUrl': imagemUrl,
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
        .collection("carrinhoItens")
        .snapshots();
  }

  Future<void> deleteProduto(idDoProduto) async {
    try {
      DocumentReference itemRef = _db
          .collection('usuarios')
          .doc(uid)
          .collection('carrinhoItens')
          .doc(idDoProduto);

      await itemRef.delete();
    } on Exception catch (e) {
      print("Erro ao Deletar: $e");
    }
  }

  Future<void> atualizaQuantidadeNoCarrinho(idProduto, novaQuantidade) async {
    if (uid == null) {
      print(
        "Erro: UID do usuário não está disponível para atualizar o carrinho.",
      );
    }
    DocumentReference itemRef = _db
        .collection("usuarios")
        .doc(uid)
        .collection("carrinhoItens")
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
