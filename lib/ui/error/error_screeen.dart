import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, required this.uri});

  final String uri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(CafeString.paginaNaoEncontrada)),
      body: Column(
        children: [
          Center(child: Text('${CafeString.naoEncontreiUmaPaginaPara}: $uri')),
          ElevatedButton(
            onPressed: () => context.go(Routes.initial),
            child: const Text(CafeString.paginaInicial),
          ),
        ],
      ),
    );
  }
}
