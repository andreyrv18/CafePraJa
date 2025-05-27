class ItemCardapio {
  ItemCardapio({
    required this.id,
    required this.nome,
    required this.preco,
    required this.disponivel,
    this.descricao,
  });
  final String id;
  final String nome;
  final double preco;
  final bool disponivel;
  final String? descricao;
}
