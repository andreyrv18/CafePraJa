import 'package:cafe_pra_ja/services/database_service.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  late DatabaseService _dbService;
  static const String _testeUidFixo = "dqoFBe79WG5ZUv1qC6i3";

  CartProvier() {
    _dbService = DatabaseService(uid: _testeUidFixo);
    recuperarItensCarrinho();
  }

  Future<void> recuperarItensCarrinho() async {
    await _dbService.getCartItemsStream();
  }

  Future<void> adicionarItem(produto) async {
    await _dbService.addOrUpdateItemNoCarrinho(
      produto.idProduto,
      produto.nomeProduto,
      produto.precoUnitario,
      produto.imagemUrl,
    );
  }

  Future<void> removerItem(idProduto) async {
    await _dbService.deleteProduto(idProduto);
  }

  Future<void> atualizarQuantidade(idProduto, novaQuantidade) async {
    await _dbService.atualizaQuantidadeNoCarrinho(idProduto, novaQuantidade);
  }
}
