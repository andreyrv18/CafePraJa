import 'package:cafe_pra_ja/providers/menu_provider.dart';
import 'package:cafe_pra_ja/screens/home/home_screen_bloc.dart';
import 'package:cafe_pra_ja/screens/home/home_screen_event.dart';
import 'package:cafe_pra_ja/screens/home/home_screen_state.dart';
import 'package:cafe_pra_ja/screens/home/widgets/cardapio_grid.dart';
import 'package:cafe_pra_ja/screens/home/widgets/categorias.dart';
import 'package:cafe_pra_ja/widgets/app_bar_widget.dart';
import 'package:cafe_pra_ja/navigation/navigation_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
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

  void _switchBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  Widget page(state, theme, textTheme) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _switchBranch,
      ),
      body: Container(
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
            SizedBox(height: 40, child: const CategoriasList()),
            SizedBox(height: 12),
            Expanded(child: const CardapioGrid()),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (_) => HomeScreenBloc(),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          switch (state) {
            case HomeScreenLoadingState():
              return const Center(child: CircularProgressIndicator());
            case HomeScreenSuccessState():
              return page(state, theme, textTheme);
            case HomeScreenErrorState():
              return const Center(child: Text("error"));

            default:
              return page(state, theme, textTheme);
          }
        },
      ),
    );
  }
}
