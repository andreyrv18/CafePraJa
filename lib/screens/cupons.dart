import 'package:flutter/material.dart';

// Paleta de cores inspirada em café
const Color corMarromEscuro = Color(
  0xFF2D1B0B,
); // Ajustado para ser mais próximo do marrom transparente do perfil
const Color corMarromMedio = Color(
  0xFF7B4F2F,
); // Marrom médio do cursor do perfil
const Color corBege = Color(
  0xFFA1887F,
); // Mantido o bege original, próximo ao onSurface do perfil
const Color corCremeClaro = Color(
  0xFFD7CCC8,
); // Mantido o creme claro, próximo ao onPrimary do perfil
const Color corTextoClaro = Colors.white;
const Color corTextoEscuro = Color(
  0xFF2D1B0B,
); // Ajustado para o marrom escuro mais forte

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
        // Define o esquema de cores primário com um tom de café
        primaryColor:
            corMarromMedio, // Usando primaryColor para o tom principal
        // Define a cor de fundo padrão do Scaffold
        scaffoldBackgroundColor: corCremeClaro,
        // Define o tema do AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: corMarromEscuro, // Cor de fundo da AppBar
          foregroundColor: corTextoClaro, // Cor do texto e ícones da AppBar
          elevation: 0, // Remove a sombra da AppBar para um look mais flat
        ),
        // Define o tema do Card
        cardTheme: CardTheme(
          color: corBege, // Cor de fundo dos Cards
          elevation: 2,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        // Define o tema do ListTile
        listTileTheme: ListTileThemeData(
          iconColor: corTextoEscuro,
          textColor: corTextoEscuro, // Cor padrão para o texto no ListTile
        ),
        // Define a cor do texto padrão
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: corTextoEscuro),
          bodyMedium: TextStyle(color: corTextoEscuro),
          titleMedium: TextStyle(
            color: corTextoEscuro,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(color: corMarromMedio), // Cor para subtitulos
        ),
        // Adicionando um esquema de cores para mais granularidade
        colorScheme: ColorScheme.light(
          primary: corMarromMedio, // Equivalente ao primary do código Perfil
          onPrimary: corCremeClaro, // Equivalente ao onPrimary do código Perfil
          onSurface: corBege, // Equivalente ao onSurface do código Perfil
          background: corCremeClaro, // Fundo geral
          surface: corBege, // Superfícies como cards
          onBackground: corTextoEscuro,
          onSurfaceVariant:
              corMarromEscuro, // Cor mais escura para alguns elementos
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
                    color:
                        Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant, // Usando a cor mais escura do esquema
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
