import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/auth/cadastro/cadastro_screen.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_screen.dart';
import 'package:cafe_pra_ja/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:cafe_pra_ja/ui/checkout/checkout_screen.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cafe_pra_ja/ui/cupons/cupons_screen.dart';
import 'package:cafe_pra_ja/ui/home/details/product_details.dart';
import 'package:cafe_pra_ja/ui/home/home_screen_page.dart';
import 'package:cafe_pra_ja/ui/home/view_models/home_viewmodel.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

//
// final navigatorKey = GlobalKey<NavigatorState>();
//
// class AppRouteInformation<T> {
//   final T? data;
//   final bool maintainState;
//
//   AppRouteInformation({this.data, this.maintainState = true});
// }
//
// class AppRouter {
//   static final AppRouter instance = AppRouter._internal();
//
//   AppRouter._internal();
//
//   GoRouter? _router;
//
//   GoRouter get router {
//     if (_router == null) {
//       _initRouter();
//       return _router!;
//     }
//     return _router!;
//   }
//
//   void go<T>(String path, {T? data}) {
//     _router?.go(path, extra: AppRouteInformation<T>(data: data));
//   }
//
//   Future<T?>? push<T>(String path, {T? data}) {
//     return _router?.push<T>(path, extra: AppRouteInformation<T>(data: data));
//   }
//
//   void _initRouter() {
//     _router = GoRouter(
//       initialLocation: "/",
//       debugLogDiagnostics: true,
//       navigatorKey: navigatorKey,
//       routes: [
//         StatefulShellRoute.indexedStack(
//           builder:
//               (context, state, navigationShell) =>
//                   AppShell(navigationShell: navigationShell),
//           branches: [
//             StatefulShellBranch(
//               routes: [
//                 GoRoute(
//                   path: "/",
//                   builder: (context, state) => const HomeScreen(title: "Home"),
//                   routes: [
//                     GoRoute(
//                       path: "details/:id",
//                       builder: (context, state) {
//                         final extra =
//                             state.extra as AppRouteInformation<MenuItemModel>?;
//                         final menuItem = extra?.data;
//
//                         if (menuItem == null) {
//                           return ErrorScreen();
//                         }
//
//                         return DetailScreen(item: menuItem);
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             StatefulShellBranch(
//               routes: [
//                 GoRoute(
//                   path: "/checkout",
//                   builder: (context, state) => const CheckoutScreen(),
//                 ),
//               ],
//             ),
//             StatefulShellBranch(
//               routes: [
//                 GoRoute(
//                   path: "/cupons",
//                   builder: (context, state) => const CuponsScreen(),
//                 ),
//               ],
//             ),
//             StatefulShellBranch(
//               routes: [
//                 GoRoute(
//                   path: "/perfil",
//                   builder: (context, state) => const PerfilScreen(),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
//         GoRoute(
//           path: "/cadastro",
//           builder: (context, state) => const CadastroScreen(),
//         ),
//       ],
//     );
//   }
//
//   Page buildPage(Widget child) {
//     return MaterialPage(child: child);
//   }
// }

/// Top go_router entry point.
///
/// Listens to changes in [AuthTokenRepository] to redirect the user
/// to /login when the user logs out.
// GoRouter router(AuthRepository authRepository) => GoRouter(
GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  // redirect: _redirect,
  // refreshListenable: authRepository,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return HomeScreen();
      },
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            if (context.read<MenuProvider>().categoriaSelecionadaId != id) {
              return Scaffold(body: Center(child: Text(CafeString.fazerLogin)));
            }
            return DetailScreen(item: context.read());
          },
        ),

        GoRoute(
          path: Routes.checkout,
          builder: (context, state) {
            return CheckoutScreen();
          },
        ),
        GoRoute(
          path: Routes.cupons,
          builder: (context, state) {
            return CuponsScreen();
          },
        ),
        GoRoute(
          path: Routes.perfil,
          builder: (context, state) {
            return PerfilScreen();
          },
        ),
        GoRoute(
          path: Routes.cadastro,
          builder: (context, state) {
            return CadastroScreen();
          },
        ),
      ],
    ),

    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginScreen(viewModel: LoginViewModel());
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
