import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final double? scrolledUnderElevation;

  const AppBarWidget({super.key, this.scrolledUnderElevation});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Widget _actions() {
    final ColorScheme theme = Theme.of(context).colorScheme;

    final String currentRoute = GoRouterState.of(context).uri.toString();

    if (currentRoute == Routes.initial) {
      return IconButton(
        color: theme.onPrimary,
        iconSize: 36,
        alignment: Alignment.center,
        tooltip: CafeString.carrinhoCompras,
        onPressed: () {
          context.go(Routes.checkout);
        },
        icon: Icon(Icons.shopping_cart),
      );
    }

    if (currentRoute == Routes.perfil) {
      return IconButton(
        color: theme.onPrimary,
        iconSize: 36,
        alignment: Alignment.center,
        tooltip: CafeString.sair,
        icon: const Icon(Icons.logout_sharp),
        onPressed: () {
          _signOut();
          context.go(Routes.initial);
        },
      );
    }

    return IconButton(
      icon: Icon(Icons.account_circle),
      onPressed: () {
        context.go(Routes.perfil);
      },
      color: theme.onPrimary,
      iconSize: 36,
      alignment: Alignment.center,
      tooltip: CafeString.perfil,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: widget.scrolledUnderElevation,
      backgroundColor: theme.primary,
      elevation: 8,

      title: Row(
        children: [
          TextButton(
            onPressed: () {
              context.go(Routes.bemVindo);
            },
            child: Row(
              children: [
                Icon(Icons.pin_drop_sharp, color: theme.onPrimary, size: 20),
                const SizedBox(width: 8),

                Text(
                  textAlign: TextAlign.center,
                  CafeString.pinhaisParana,
                  style: textTheme.bodyLarge?.copyWith(color: theme.onPrimary),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [_actions()],
    );
  }
}
