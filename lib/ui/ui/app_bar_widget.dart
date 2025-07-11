import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            context.go(Routes.perfil);
          },
          color: theme.onSecondary,
          iconSize: 44,
          alignment: Alignment.center,
          tooltip: CafeString.perfil,
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
              TextButton(
                style: TextButton.styleFrom(foregroundColor: theme.onPrimary),
                onPressed: () {
                  context.go(Routes.bemVindo);
                },
                child: Column(
                  children: [
                    Text(CafeString.localizacao),
                    Text(
                      CafeString.pinhaisParana,
                      style: textTheme.titleMedium?.copyWith(
                        color: theme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
