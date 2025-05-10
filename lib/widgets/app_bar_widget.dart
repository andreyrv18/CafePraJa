import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.colorScheme.secondary, theme.colorScheme.onSurface],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {},
          color: theme.colorScheme.onSecondary,
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
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              Text(
                "Pinhais, Paraná",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
