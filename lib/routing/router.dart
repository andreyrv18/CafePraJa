import 'package:cafe_pra_ja/domain/models/menu_item_model.dart';
import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/auth/cadastro/cadastro_screen.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_screen.dart';
import 'package:cafe_pra_ja/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:cafe_pra_ja/ui/checkout/checkout_screen.dart';
import 'package:cafe_pra_ja/ui/cupons/cupons_screen.dart';
import 'package:cafe_pra_ja/ui/home/home_screen_page.dart';
import 'package:cafe_pra_ja/ui/home/view_models/home_viewmodel.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../ui/home/details/product_details.dart';

/// Top go_router entry point.
/// Listens to changes in [AuthTokenRepository] to redirect the user
/// to /login when the user logs out.
// GoRouter router(AuthRepository authRepository) => GoRouter(
GoRouter router() => GoRouter(
  initialLocation: Routes.initial,
  debugLogDiagnostics: true,
  // errorBuilder: (context, state) => ErrorScreen(),
  // redirect: (_, __) => Routes.home,
  // refreshListenable: authRepository,
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
            final id = state.pathParameters['id']!;

            final homeViewModel = context.read<HomeViewModel>();
            MenuItemModel? item = homeViewModel.getItem(id);

            return ProductDetailScreen(item: item);
          },
        ),
      ],
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
