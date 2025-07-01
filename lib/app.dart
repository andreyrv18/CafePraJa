import 'package:cafe_pra_ja/config/app_router.dart';
import 'package:cafe_pra_ja/models/cart_item_model.dart';
import 'package:cafe_pra_ja/providers/cart_provider.dart';
import 'package:cafe_pra_ja/providers/cupons_provider.dart';
import 'package:cafe_pra_ja/providers/menu_provider.dart';
import 'package:cafe_pra_ja/screens/checkout/checkout.dart';
import 'package:cafe_pra_ja/screens/home/details/product_details.dart';
import 'package:cafe_pra_ja/screens/home/home_screen_page.dart';
import 'package:cafe_pra_ja/models/cupons_item_model.dart';
import 'package:cafe_pra_ja/widgets/app_bar_widget.dart';
import 'package:cafe_pra_ja/navigation/navigation_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'util.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Noto Sans");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiProvider(
      builder: (context, child) {
        return child!;
      },
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => CuponsProvider()),
        StreamProvider<List<CartItemModel>>(
          create:
              (context) =>
                  context.read<CartProvider>().getItensDoCarrinhoStream(),
          initialData: const [],
        ),
        StreamProvider<List<CuponsItemModel>>(
          create: (context) => context.read<CuponsProvider>().cuponsStream,
          initialData: const [],
        ),
      ],
      child: MaterialApp.router(
        title: 'Café Pra Já',
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        routerConfig: AppRouter.instance.router,
      ),
    );
  }
}
