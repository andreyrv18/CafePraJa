import 'package:cafe_pra_ja/models/cart_item_model.dart';
import 'package:cafe_pra_ja/providers/cart_provider.dart';
import 'package:cafe_pra_ja/providers/menu_provider.dart';
import 'package:cafe_pra_ja/widgets/navigation_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'theme.dart';
import 'util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        // Este StreamProvider depende da instância de CartProvider criada acima.
        // Ele fornecerá a List<CartItemModel> emitida pelo stream para seus descendentes.
        StreamProvider<List<CartItemModel>>(
          create:
              (context) =>
                  context.read<CartProvider>().getItensDoCarrinhoStream(),
          initialData:
              const [], // Crucial para evitar erros antes do primeiro snapshot
        ),
        ChangeNotifierProvider(
          create: (_) {
            // Se você quiser que os itens carreguem assim que o app iniciar:
            // return MenuProvider()..carregarItensDoCardapio();

            // Se você prefere chamar carregarItensDoCardapio() manualmente de uma tela:
            return MenuProvider();
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Roboto", "Noto Sans");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Café Pra Já',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const NavigationBottomBar(),
    );
  }
}
