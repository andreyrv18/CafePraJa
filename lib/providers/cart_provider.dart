import 'package:cafe_pra_ja/models/cart_item_model.dart';
import 'package:cafe_pra_ja/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  late DatabaseService _dbService;
  static const String _testeUidFixo = "dqoFBe79WG5ZUv1qC6i3";

  CartProvider() {
    _dbService = DatabaseService(uid: _testeUidFixo);
  }

  Stream<List<CartItemModel>> getItensDoCarrinhoStream() {
    if (_dbService == null) {
        return Stream.empty(); // Retorna um stream vazio para evitar crash
    }
    return _dbService.getCartItemsStream().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return CartItemModel.fromFirestore(
          doc as DocumentSnapshot<Map<String, dynamic>>,
        );
      }).toList();
    });
  }

  Future<void> adicionarItem(
    idProduto,
    nomeProduto,
    precoUnitario,
    imagemUrl,
  ) async {
    await _dbService.addOrUpdateItemNoCarrinho(
      idProduto,
      nomeProduto,
      precoUnitario,
      imagemUrl,
    );
  }

  Future<void> removerItem(idProduto) async {
    await _dbService.deleteProduto(idProduto);
  }

  Future<void> atualizarQuantidade(idProduto, novaQuantidade) async {
    await _dbService.atualizaQuantidadeNoCarrinho(idProduto, novaQuantidade);
  }
}
