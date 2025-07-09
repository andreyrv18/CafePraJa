import 'package:cloud_firestore/cloud_firestore.dart';

class MenuItemModel {
  final String id; // ID do documento do item no Firestore
  final String nome;
  late final bool disponivel;
  final double preco;
  final String categoriaId; // Para saber a qual categoria o item pertence
  final String imagemUrl;
  final String descricao;

  MenuItemModel({
    required this.id,
    required this.nome,
    required this.disponivel,
    required this.preco,
    required this.categoriaId,
    required this.imagemUrl,
    required this.descricao,
  });

  factory MenuItemModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    String categoriaId,
  ) {
    Map<String, dynamic> data = doc.data()!; // Pega os dados do documento
    return MenuItemModel(
      id: doc.id,
      nome: data['nome'] as String? ?? 'Nome Indisponível',
      disponivel: data['disponivel'] as bool? ?? false,
      preco: (data['preco'] as num? ?? 0.0).toDouble(),
      categoriaId: categoriaId,
      imagemUrl: data["imagemUrl"] as String? ?? "Produto sem Imagem",
      descricao: data["descricao"] as String? ?? "Produto sem Descrição",
    );
  }

  @override
  String toString() {
    return nome;
    // Personalize isso para incluir as propriedades que você deseja imprimir
  }
}
