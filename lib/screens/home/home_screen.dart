import 'package:cafe_pra_ja/providers/menu_provider.dart';
import 'package:cafe_pra_ja/screens/home/widgets/cardapio.dart';
import 'package:cafe_pra_ja/screens/home/widgets/categorias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  late MenuProvider _menuProviderInstance;
  @override
  void initState() {
    super.initState();

    _menuProviderInstance = Provider.of<MenuProvider>(context, listen: false);
    myController.addListener(() {
      _menuProviderInstance.atualizarTermoBuscaCardapio(myController.text);
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      color: theme.surface,
      child: Column(
        children: [
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Encontre seu café favorito!"),
                hintStyle: textTheme.labelMedium,
                hint: Text("Ex: Expresso, Cappuccino, Arábica..."),
                prefixIcon: Icon(Icons.search, color: theme.onSurface),
              ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(height: 40, child: const CafeListView()),
          SizedBox(height: 12),
          Expanded(child: const CafeGridView()),
        ],
      ),
    );
  }
}
