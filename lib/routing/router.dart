import 'package:cafe_pra_ja/routing/app_shell.dart';
import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/auth/cadastro/cadastro_screen.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_screen_page.dart';
import 'package:cafe_pra_ja/ui/bemvindo/bemvindo_screeen.dart';
import 'package:cafe_pra_ja/ui/checkout/checkout_screen.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cafe_pra_ja/ui/cupons/cupons_screen.dart';
import 'package:cafe_pra_ja/ui/error/error_screeen.dart';
import 'package:cafe_pra_ja/ui/home/details/product_detail_screen.dart';
import 'package:cafe_pra_ja/ui/home/home_screen_page.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

/// Top go_router entry point.
/// Listens to changes in [AuthTokenRepository] to redirect the user
/// to /login when the user logs out.
// GoRouter router(AuthRepository authRepository) => GoRouter(
GoRouter router() => GoRouter(
  navigatorKey: _rootNavigatorKey,

  initialLocation: Routes.initial,
  debugLogDiagnostics: true,
  onException: (context, state, router) {
    router.go(Routes.notFound, extra: state.uri.toString());
  },
  // errorBuilder: (context, state) => ErrorScreen(),
  // redirect: (_, __) => Routes.home,
  // refreshListenable: authRepository,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.initial,
              builder: (context, state) {
                return HomeScreen();
              },
              routes: [
                GoRoute(
                  path: Routes.detailsComId,
                  builder: (context, state) {
                    // final id = state.pathParameters['id']!;

                    // ProductModel? item;

                    return ProductDetailScreen(item: 1);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.checkout,
              builder: (context, state) {
                return CheckoutScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.cupons,
              builder: (context, state) {
                return CuponsScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.perfil,
              builder: (context, state) {
                return PerfilScreen();
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.cadastro,
      builder: (context, state) {
        return CadastroScreen();
      },
    ),

    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: Routes.bemVindo,
      builder: (context, state) {
        return BemvindoScreen(title: CafeString.bemVindo,);
      },
    ),

    GoRoute(
      path: Routes.notFound,
      builder: (BuildContext context, GoRouterState state) {
        return NotFoundScreen(uri: state.extra as String? ?? '');
      },
    ),
  ],
);

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
// Future<String?> _redirect(BuildContext context, GoRouterState state) async {
//   // if the user is not logged in, they need to login
//   final loggedIn = await context.read<AuthRepository>().isAuthenticated;
//   final loggingIn = state.matchedLocation == Routes.login;
//   if (!loggedIn) {
//     return Routes.login;
//   }
//
//   // if the user is logged in but still on the login page, send them to
//   // the home page
//   if (loggingIn) {
//     return Routes.home;
//   }
//
//   // no need to redirect at all
//   return null;
// }
