import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  final String id;
  final String nomeProduto;
  final int quantidade;
  final double precoUnitario;
  final String? imagemUrl;

  CartItemModel({
    required this.id,
    required this.nomeProduto,
    required this.quantidade,
    required this.precoUnitario,
    this.imagemUrl,
  });

  factory CartItemModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    Map<String, dynamic> data = doc.data()!;

    return CartItemModel(
      id: doc.id,
      nomeProduto: data['nomeProduto'] ?? 'Produto Desconhecido',
      quantidade: (data['quantidade'] ?? 0).toInt(),
      precoUnitario: (data['precoUnitario'] ?? 0.0).toDouble(),
      imagemUrl: data['imagemUrl'],
    );
  }
}
