import 'package:cafe_pra_ja/screens/perfil.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double? scrolledUnderElevation;
  const AppBarWidget({super.key, this.scrolledUnderElevation});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      scrolledUnderElevation: scrolledUnderElevation,
      backgroundColor: theme.inversePrimary,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.secondary, theme.primary],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Perfil()),
            );
          },
          color: theme.onSecondary,
          iconSize: 44,
          alignment: Alignment.center,
          tooltip: "Perfil",
        ),
      ],
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "localização",
                style: textTheme.titleSmall?.copyWith(color: theme.onPrimary),
              ),
              Text(
                "Pinhais, Paraná",
                style: textTheme.titleMedium?.copyWith(color: theme.onPrimary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
