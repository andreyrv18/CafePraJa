import 'package:cafe_pra_ja/routing/router.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cafe_pra_ja/ui/core/themes/theme.dart';
import 'package:cafe_pra_ja/ui/core/themes/util.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    TextTheme textTheme = createTextTheme(context, 'Roboto', 'Noto Sans');
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: [
      //   AppLocalizationDelegate(),
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      // ],
      title: CafeString.appTitle,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: router(),
    );
  }
}
