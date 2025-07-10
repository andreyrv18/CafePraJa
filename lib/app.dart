import 'package:cafe_pra_ja/domain/models/cart_item_model.dart';
import 'package:cafe_pra_ja/domain/models/cupons_item_model.dart';
import 'package:cafe_pra_ja/routing/router.dart';
import 'package:cafe_pra_ja/ui/checkout/view_models/checkout_viewmodel.dart';
import 'package:cafe_pra_ja/ui/core/themes/theme.dart';
import 'package:cafe_pra_ja/ui/core/themes/util.dart';
import 'package:cafe_pra_ja/ui/cupons/view_models/cupons_viewmodel.dart';
import 'package:cafe_pra_ja/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto", "Noto Sans");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiProvider(
      builder: (context, child) {
        return child!;
      },
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
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
        debugShowCheckedModeBanner: false,
        // localizationsDelegates: [
        //   AppLocalizationDelegate(),
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        // ],
        title: 'Café Pra Já',
        theme: theme.light(),
        darkTheme: theme.dark(),
        themeMode: ThemeMode.system,
        routerConfig: router(),
      ),
    );
  }
}
