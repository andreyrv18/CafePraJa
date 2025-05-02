import 'package:flutter/material.dart';
import 'package:cafe_pra_ja/screens/bemvindo.dart';
import 'package:cafe_pra_ja/screens/home.dart';
import 'util.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Noto Sans", "Noto Sans");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Café Pra Já',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 14));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Página Inicial'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Bemvindo(title: 'Bem vindo');
  }
}
