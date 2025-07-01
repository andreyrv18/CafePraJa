import 'package:cafe_pra_ja/app.dart';
import 'package:cafe_pra_ja/screens/checkout/checkout.dart';
import 'package:cafe_pra_ja/screens/cupons/cupons.dart';
import 'package:cafe_pra_ja/screens/home/details/product_details.dart';
import 'package:cafe_pra_ja/screens/home/home_screen_page.dart';
import 'package:cafe_pra_ja/screens/perfil/perfil.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouteInformation<T> {
  final T? data;
  final bool maintainState;

  AppRouteInformation({this.data, this.maintainState = true});
}

class AppRouter {
  static final AppRouter instance = AppRouter._internal();

  AppRouter._internal();

  GoRouter? _router;

  GoRouter get router {
    if (_router == null) {
      _initRouter();
      return _router!;
    }
    return _router!;
  }

  void go<T>(String path, {T? data}) {
    _router?.go(path, extra: AppRouteInformation<T>(data: data));
  }

  Future<T?>? push<T>(String path, {T? data}) {
    return _router?.push<T>(path, extra: AppRouteInformation<T>(data: data));
  }

  void _initRouter() {
    _router = GoRouter(
      initialLocation: "/home",
      debugLogDiagnostics: true,
      navigatorKey: navigatorKey,
      routes: [
        StatefulShellRoute.indexedStack(
          builder:
              (context, state, navigationShell) =>
                  HomeScreen(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: "/",
                  builder: (context, state) => const PaginaCupons(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: "/checkout",
                  builder: (context, state) => Checkout(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(path: "/home", builder: (context, state) => const Checkout()),
      ],
    );
  }

  Page buildPage(Widget child) {
    return MaterialPage(child: child);
  }
}
