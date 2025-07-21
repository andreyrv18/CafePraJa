import 'package:cafe_pra_ja/config/context_extensions.dart';
// import 'package:cafe_pra_ja/data/repositories/cart_repository.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cafe_pra_ja/ui/home/home_screen_bloc.dart';
import 'package:cafe_pra_ja/ui/home/home_screen_state.dart';
// import 'package:cafe_pra_ja/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  final myController = TextEditingController();
  // late HomeViewModel _menuProviderInstance;
  // late final CartRepository _cartRepository;
  @override
  void initState() {
    super.initState();
    initialization();

    // _menuProviderInstance = Provider.of<HomeViewModel>(context, listen: false);
    // myController.addListener(() {
    //   _menuProviderInstance.atualizarTermoBuscaCardapio(myController.text);
    // });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget _categoriasList(HomeScreenState state) {
    // final menuProvider = context.watch<HomeViewModel>();

    if(state is HomeScreenLoadingState) {
      return const SizedBox(
        height: 50,
        child: Center(child: CircularProgressIndicator()),
      );

    }


      return ListView.builder(
        // itemCount: listaDeCategorias.length,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // final item = listaDeCategorias[index];
          // final String categoriaId = item['id'];
          // final String nome = item['nome']?.toString() ?? CafeString.semNome;
          // final isSelected = menuProvider.categoriaSelecionadaId == categoriaId;
          return InkWell(
            onTap: () {
              // menuProvider.selecionarCategoria(categoriaId);
            },
            borderRadius: const BorderRadius.all(Radius.circular(10)),

            child: Container(
              width: 160,
              // decoration: BoxDecoration(
              //   color:
              //   isSelected ? context.theme.primary : context.theme.surfaceDim,
              //   border: Border.all(
              //     color:
              //     isSelected
              //         ? Colors.transparent
              //         : context.theme.outlineVariant,
              //   ),
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Text(
                  'nome',
                  textAlign: TextAlign.center,

                  overflow: TextOverflow.ellipsis,

                  // style:
                  // isSelected
                  //     ? TextStyle(
                  //   color: context.theme.onPrimary,
                  //   fontSize: context.textTheme.titleMedium?.fontSize,
                  //   fontWeight: context.textTheme.titleMedium?.fontWeight,
                  // )
                  //     : TextStyle(
                  //   color: context.theme.onSurface,
                  //   fontSize: context.textTheme.titleMedium?.fontSize,
                  //   fontWeight: context.textTheme.titleMedium?.fontWeight,
                  // ),
                ),
              ),
            ),
          );
        },
      );

    // final List<Map<String, dynamic>> listaDeCategorias =
    //     menuProvider.categorias;


  }

  Widget _cardapioGrid(state) {
    // final menuProvider = context.watch<HomeViewModel>();

    if(state is HomeScreenErrorState) {
      return Center(child: Text('${CafeString.erro}: {menuProvider.errorMessage}'));
    }

    if(state is HomeScreenLoadingState) {
      return const Center(child: CircularProgressIndicator());

    }
    

    // if (menuProvider.errorMessage != null) {
    // return Center(child: Text('${CafeString.erro}: ${menuProvider.errorMessage}'));

    // }
    // if (menuProvider.carregandoCardapio &&
    //     menuProvider.itensFiltradosDoCardapio.isEmpty) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    // final List<ProductModel> itensParaExibir =
    //     menuProvider.itensFiltradosDoCardapio;
    //
    // if (itensParaExibir.isEmpty && !menuProvider.carregandoCardapio) {
    //   return Center(
    //     child: Text(
    //       menuProvider.termoDeBuscaCardapio.isEmpty
    //           ? CafeString.nenhumItemEncontradoNoCardapio
    //           : '${CafeString.nenhumItemEnconradoPara} ${menuProvider.termoDeBuscaCardapio}.',
    //     ),
    //   );
    // }

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            // itemCount: itensParaExibir.length,
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.80,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemBuilder: (BuildContext context, index) {
              // final ProductModel item = itensParaExibir[index];

              return InkWell(
                onTap: () {
                  // context.go(Routes.detailsWithId(item.id));
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: context.theme.surfaceContainer,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(' item.imagemUrl.isEmpty')
                            // item.imagemUrl.isEmpty
                            //     ? Hero(tag: item.id, child: const Placeholder())
                            //     : Hero(
                            //       tag: item.id,
                            //       child: Material(
                            //         color: Colors.transparent,
                            //         child: Image.asset(
                            //           '${item.imagemUrl}.jpg',
                            //           fit: BoxFit.cover,
                            //         ),
                            //       ),
                            //     ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                           ' item.nome',
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleLarge?.copyWith(
                              color: context.theme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2, // Limita o nome a 2 linhas
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              overflow:TextOverflow.ellipsis ,
                              'R\$ {item.preco.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: context.theme.onSurfaceVariant,
                                fontSize: context.textTheme.titleLarge?.fontSize,
                              ),
                            ),
                          ),
                          FloatingActionButton(
                            heroTag: '${CafeString.fab}{item.id}',
                            shape: BeveledRectangleBorder(),
                            tooltip: CafeString.comprar,
                            mini: true,
                            backgroundColor: context.theme.tertiary,
                            foregroundColor: context.theme.onTertiary,
                            child: Icon(Icons.add_shopping_cart_outlined),
                            onPressed: () {
                              // _cartRepository.addOrUpdateItemNoCarrinho(
                              //   item.id,
                              //   item.nome,
                              //   item.preco,
                              //   item.categoriaId,
                              //   item.imagemUrl,
                              //   item.descricao,
                              // );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _page(HomeScreenState state) {
    return Scaffold(
      body: Container(
        color: context.theme.surface,
        child: Column(
          children: [
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(CafeString.encontreSeuCafeFavorito),
                  hintStyle: context.textTheme.labelMedium,
                  hint: Text(CafeString.exemploTermoBusca),
                  prefixIcon: Icon(
                    Icons.search,
                    color: context.theme.onSurface,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(height: 40, child: _categoriasList(state)),
            SizedBox(height: 12),
            Expanded(child: _cardapioGrid(state)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeScreenBloc(),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (BuildContext context, HomeScreenState state) {
          switch (state) {
            case HomeScreenLoadingState():
              return const Center(child: CircularProgressIndicator());
            case HomeScreenSuccessState():
              return _page(state);
            case HomeScreenErrorState():
              return const Center(child: Text(CafeString.erro));

            default:
              return _page(state);
          }
        },
      ),
    );
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print

    print(CafeString.vai);
    FlutterNativeSplash.remove();
  }
}
