import 'package:cafe_pra_ja/firestore/database_service.dart';
import 'package:flutter/material.dart';
import 'item_cardapio.dart';

class Cardapio extends StatefulWidget {
  const Cardapio({super.key});

  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  final DatabaseService _dbService = DatabaseService();
  late Future<List<Map<String, dynamic>>> _cardapioFuture;

  @override
  void initState() {
    super.initState();
    _cardapioFuture = _dbService.getCardapio();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("HOme"));
  }
}
