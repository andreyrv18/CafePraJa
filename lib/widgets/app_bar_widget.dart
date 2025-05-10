import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
  double? scrolledUnderElevation;
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      scrolledUnderElevation: scrolledUnderElevation,
      shadowColor: theme.shadow,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.secondary, theme.onSurface],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {},
          color: theme.onSecondary,
          iconSize: 44,
          alignment: Alignment.center,
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
