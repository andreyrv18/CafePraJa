import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_assets.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BemvindoScreen extends StatelessWidget {
  final String title;

  const BemvindoScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: theme.onSurfaceVariant,
      body: Column(
        children: [
          SizedBox(
            height: 508,
            child: Image.asset(CafeAssets.bemvindo, fit: BoxFit.cover),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      CafeString.horaDeUmaParadaParaoCafe,
                      style: TextStyle(
                        color: theme.onPrimary,
                        fontSize: textTheme.titleLarge?.fontSize,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      CafeString.doseDiariaDeCafeSlipsis,
                      style: TextStyle(
                        color: theme.onPrimary,
                        fontSize: textTheme.bodyLarge?.fontSize,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 16), // Espaçamento entre os widgets
                  SizedBox(
                    width: 315,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(theme.primary),
                      ),
                      onPressed: () {
                        context.go(Routes.initial);
                      },
                      child: Text(
                        CafeString.vamosLa,
                        style: TextStyle(
                          color: theme.onPrimary,
                          fontSize: textTheme.titleLarge?.fontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
