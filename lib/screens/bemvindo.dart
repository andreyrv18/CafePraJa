import 'package:cafe_pra_ja/widgets/navigation_bottom_bar.dart';
import 'package:flutter/material.dart';

class Bemvindo extends StatelessWidget {
  final String title;
  const Bemvindo({super.key, required this.title});

  void _onPressedItem(context) => Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const NavigationBottomBar()),
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
      body: Column(
        children: [
          SizedBox(
            height: 508,
            child: Image.asset("assets/images/bemvindo.jpg", fit: BoxFit.cover),
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
                      "Hora de uma parada para o café",
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontSize: theme.textTheme.titleLarge?.fontSize,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Sua dose diária de café fresquinho entregue na sua porta. Comece agora a sua jornada no mundo do café!",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: theme.textTheme.bodyLarge?.fontSize,
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
                        backgroundColor: WidgetStateProperty.all(
                          theme.colorScheme.primary,
                        ),
                      ),
                      onPressed: () => _onPressedItem(context),
                      child: Text(
                        "Vamos lá!",
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: theme.textTheme.titleLarge?.fontSize,
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
