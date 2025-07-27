import 'dart:async';

import 'package:cafe_pra_ja/data/services/auth_service.dart';
import 'package:cafe_pra_ja/routing/app_shell.dart';
import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/auth/cadastro/cadastro_page.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_page.dart';
import 'package:cafe_pra_ja/ui/bemvindo/bemvindo_screeen.dart';
import 'package:cafe_pra_ja/ui/checkout/checkout_page.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cafe_pra_ja/ui/cupons/cupons_page.dart';
import 'package:cafe_pra_ja/ui/error/not_found_page.dart';
import 'package:cafe_pra_ja/ui/home/details/product_detail_page.dart';
import 'package:cafe_pra_ja/ui/home/home_page.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_page.dart';
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
  restorationScopeId: 'router',
  onException: (context, state, router) {
    router.go(Routes.notFound, extra: state.uri.toString());
  },
  refreshListenable: GoRouterRefreshStream(AuthService.authStateChanges),
  redirect: (context, state) {
    final isLoggedIn = AuthService.currentUser != null;
    final location = state.matchedLocation;

    // Rotas que exigem autenticação
    final List<String> protectedRoutes = [Routes.perfil, Routes.checkout];

    // Rotas de autenticação
    final List<String> authRoutes = [Routes.login, Routes.cadastro];

    // Se tentar acessar rota protegida sem estar logado
    if (!isLoggedIn && protectedRoutes.contains(location)) {
      return Routes.login;
    }

    // Se tentar acessar rotas de auth estando logado
    if (isLoggedIn && authRoutes.contains(location)) {
      return Routes.initial;
    }

    // Em outros casos, permite a navegação normal
    return null;
  },

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
                return HomePage();
              },
              routes: [
                GoRoute(
                  path: Routes.detailsComId,
                  builder: (context, state) {
                    // final id = state.pathParameters['id']!;

                    // ProductModel? item;

                    return ProductDetailPage(item: 1);
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
                return CheckoutPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.cupons,
              builder: (context, state) {
                return CuponsPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.perfil,
              builder: (context, state) {
                return PerfilPage();
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.cadastro,
      builder: (context, state) {
        return CadastroPage();
      },
    ),

    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: Routes.bemVindo,
      builder: (context, state) {
        return BemvindoScreen(title: CafeString.bemVindo);
      },
    ),

    GoRoute(
      path: Routes.notFound,
      builder: (BuildContext context, GoRouterState state) {
        return NotFoundPage();
      },
    ),
  ],
);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

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
