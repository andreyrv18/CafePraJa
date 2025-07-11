import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  final String id;
  final String nomeProduto;
  final int quantidade;
  final double precoUnitario;
  final String imagemUrl;
  final String descricao;

  CartItemModel({
    required this.id,
    required this.nomeProduto,
    required this.quantidade,
    required this.precoUnitario,
    required this.imagemUrl,
    required this.descricao,
  });

  factory CartItemModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    Map<String, dynamic> data = doc.data()!;

    return CartItemModel(
      id: doc.id,
      nomeProduto: data['nomeProduto'] ?? CafeString.nomeIndisponivel,
      precoUnitario: (data['precoUnitario'] ?? 0.0).toDouble(),
      quantidade: data['quantidade'] ?? 0,
      imagemUrl: data['imagemUrl'] as String? ?? CafeString.produtoSemImagem,
      descricao: data['descricao'] as String? ?? CafeString.produtoSemDescricao,
    );
  }
}
