import 'package:flutter/material.dart';

class Cupom {
  final String nome;
  final String codigo;
  final String descricao;
  final DateTime dataValidade;

  Cupom({
    required this.nome,
    required this.codigo,
    required this.descricao,
    required this.dataValidade,
  });
}

class PaginaCupons extends StatelessWidget {
  final List<Cupom> cupons = [
    Cupom(
      nome: "Desconto de 10%",
      codigo: "DESCONTO10",
      descricao: "10% de desconto em toda a loja",
      dataValidade: DateTime(2025, 5, 31),
    ),
    Cupom(
      nome: "Frete Grátis",
      codigo: "FRETEGRATIS",
      descricao: "Frete grátis para compras acima de R\$100",
      dataValidade: DateTime(2025, 6, 30),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(title: Text("Cupons")),
        body: ListView.builder(
          itemCount: cupons.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(cupons[index].nome),
                subtitle: Text(cupons[index].descricao),
                trailing: Text(cupons[index].codigo),
                onTap: () {
                  // Implementar a lógica para apresentar o cupom
                  print("Apresentar cupom: ${cupons[index].codigo}");
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
