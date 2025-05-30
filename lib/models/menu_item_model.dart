// models/menu_item_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuItemModel {
  final String id; // ID do documento do item no Firestore
  final String nome;
  late final bool disponivel;
  final double preco;
  final String categoriaId; // Para saber a qual categoria o item pertence

  MenuItemModel({
    required this.id,
    required this.nome,
    required this.disponivel,
    required this.preco,
    required this.categoriaId,
  });

  factory MenuItemModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    String categoriaId,
  ) {
    Map<String, dynamic> data = doc.data()!; // Pega os dados do documento
    return MenuItemModel(
      id: doc.id, // O ID do próprio documento
      nome: data['nome'] as String? ?? 'Nome Indisponível',
      disponivel: data['disponivel'] as bool? ?? false,
      preco: (data['preco'] as num? ?? 0.0).toDouble(), // Converte para double
      categoriaId: categoriaId, // ID da categoria pai
    );
  }
}
