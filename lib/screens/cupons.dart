import 'package:flutter/material.dart';

const Color corMarromEscuro = Color(0xFF2D1B0B);
const Color corMarromMedio = Color(0xFF7B4F2F);
const Color corBege = Color(0xFFA1887F);
const Color corCremeClaro = Color(0xFFD7CCC8);
const Color corTextoClaro = Colors.white;
const Color corTextoEscuro = Color(0xFF2D1B0B);

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
    final ThemeData theme = Theme.of(context);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: corMarromMedio,
        scaffoldBackgroundColor: corCremeClaro,
        appBarTheme: AppBarTheme(
          backgroundColor: corMarromEscuro,
          foregroundColor: corTextoClaro,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: corBege,
          elevation: 2,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        listTileTheme: ListTileThemeData(
          iconColor: corTextoEscuro,
          textColor: corTextoEscuro,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: corTextoEscuro),
          bodyMedium: TextStyle(color: corTextoEscuro),
          titleMedium: TextStyle(
            color: corTextoEscuro,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(color: corMarromMedio),
        ),
        colorScheme: ColorScheme.light(
          primary: corMarromMedio,
          onPrimary: corCremeClaro,
          surface: corBege,
          onSurface: corTextoEscuro,
          onSurfaceVariant: corMarromEscuro,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Cupons")),
        body: ListView.builder(
          itemCount: cupons.length,
          itemBuilder: (context, index) {
            final cupom = cupons[index];
            return Card(
              child: ListTile(
                title: Text(
                  cupom.nome,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  cupom.descricao,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: Text(
                  cupom.codigo,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  print("Apresentar cupom: ${cupom.codigo}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Cupom ${cupom.codigo} selecionado!"),
                      backgroundColor: theme.colorScheme.primary,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
