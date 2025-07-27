import 'package:cafe_pra_ja/data/services/cart_service.dart';

class CartRepository {
  final CartService _cartService;

  CartRepository(this._cartService);

  Future createCart(
    String idDoProduto,
    nomeProduto,
    precoUnitario,
    imagemUrl,
  ) async {
    return _cartService.createCart(
      idDoProduto,
      nomeProduto,
      precoUnitario,
      imagemUrl,
    );
  }

  Future addOrUpdateItemNoCarrinho(
    String idProduto,
    nomeProduto,
    precoUnitario,
    categoriaId,
    imagemUrl,
    descricao,
  ) async {
    return _cartService.addOrUpdateItemNoCarrinho(
      idProduto,
      nomeProduto,
      precoUnitario,
      categoriaId,
      imagemUrl,
      descricao,
    );
  }

  Future getCartItemsStream() async {
    return _cartService.getCartItemsStream();
  }

  Future deleteProduto(String idDoProduto) async {
    return _cartService.deleteProduto(idDoProduto);
  }

  Future atualizaQuantidadeNoCarrinho(String idProduto, novaQuantidade) async {
    return _cartService.atualizaQuantidadeNoCarrinho(idProduto, novaQuantidade);
  }
}

// Stream<List<CartItemModel>> getItensDoCarrinhoStream() {
//   return _dbService.getCartItemsStream().map((querySnapshot) {
//     return querySnapshot.docs.map((doc) {
//       return CartItemModel.fromFirestore(doc as DocumentSnapshot<Map<String, dynamic>>);
//     }).toList();
//   });
// }
//
// Future<void> adicionarItem(id, nome, preco, categoriaId, imagemUrl, descricao) async {
//   await _dbService.addOrUpdateItemNoCarrinho(id, nome, preco, categoriaId, imagemUrl, descricao);
// }
//
// Future<void> removerItem(idProduto) async {
//   await _dbService.deleteProduto(idProduto);
// }
//
// Future<void> atualizarQuantidade(idProduto, novaQuantidade) async {
//   await _dbService.atualizaQuantidadeNoCarrinho(idProduto, novaQuantidade);
// }
