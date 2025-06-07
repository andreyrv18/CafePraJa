import 'package:flutter/foundation.dart';
import 'package:cafe_pra_ja/models/menu_item_model.dart';
import 'package:cafe_pra_ja/services/database_service.dart';

class MenuProvider with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  List<MenuItemModel> _todosOsItensDoCardapio = [];
  List<MenuItemModel> _itensFiltradosDoCardapio = [];
  String? _mensagemErro;
  String _termoDeBuscaCardapio = "";
  bool _carregandoCardapio = false;

  List<MenuItemModel> get todosOsItensDoCardapioDEBUG =>
      _todosOsItensDoCardapio;
  String? get errorMessage => _mensagemErro;
  List<MenuItemModel> get itensFiltradosDoCardapio => _itensFiltradosDoCardapio;
  String get termoDeBuscaCardapio => _termoDeBuscaCardapio;
  bool get carregandoCardapio => _carregandoCardapio;

  Future<void> carregarItensDoCardapio() async {
    if (_carregandoCardapio) return;
    _carregandoCardapio = true;
    _mensagemErro = null;
    notifyListeners();

    try {
      _todosOsItensDoCardapio =
          await _databaseService.getTodosOsItensDoCardapio();

      _aplicarFiltroCardapio();
    } catch (e) {
      _mensagemErro = "Erro ao carregar cardápio: ${e.toString()}";
      _todosOsItensDoCardapio = [];
      _itensFiltradosDoCardapio = [];
    } finally {
      _carregandoCardapio = false;
      notifyListeners();
    }
  }

  void atualizarTermoBuscaCardapio(String novoTermo) {
    _termoDeBuscaCardapio = novoTermo.trim().toLowerCase();
    _aplicarFiltroCardapio();
    notifyListeners();
  }

  void _aplicarFiltroCardapio() {
    if (_termoDeBuscaCardapio.isEmpty) {
      _itensFiltradosDoCardapio = List.from(_todosOsItensDoCardapio);
    } else {
      _itensFiltradosDoCardapio =
          _todosOsItensDoCardapio.where((item) {
            final nomeItem = item.nome.toLowerCase();
            final categoriaItem = item.categoriaId.toLowerCase();
            return nomeItem.contains(_termoDeBuscaCardapio) ||
                categoriaItem.contains(_termoDeBuscaCardapio);
          }).toList();
    }
  }
}
