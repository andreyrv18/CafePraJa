import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, required this.uri});

  final String uri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Column(
        children: [
          Center(child: Text("Can't find a page for: $uri")),
          ElevatedButton(
            onPressed: () => context.go(Routes.initial),
            child: const Text('Go Home'),
          ),
        ],
      ),
    );
  }
}
