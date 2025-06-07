import 'package:flutter/foundation.dart';
import 'package:cafe_pra_ja/models/menu_item_model.dart';
import 'package:cafe_pra_ja/services/database_service.dart';

class MenuProvider with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  List<MenuItemModel> _todosOsItensDoCardapio = [];
  List<MenuItemModel> _itensFiltradosDoCardapio = [];
  List<Map<String, dynamic>> _categorias = [];
  String? _mensagemErro;
  String _termoDeBuscaCardapio = "";
  bool _carregandoCardapio = false;
  String? _categoriaSelecionadaId;

  String? get categoriaSelecionadaId => _categoriaSelecionadaId;

  List<Map<String, dynamic>> get categorias => _categorias;

  List<MenuItemModel> get todosOsItensDoCardapioDEBUG =>
      _todosOsItensDoCardapio;

  String? get errorMessage => _mensagemErro;

  List<MenuItemModel> get itensFiltradosDoCardapio => _itensFiltradosDoCardapio;

  String get termoDeBuscaCardapio => _termoDeBuscaCardapio;

  bool get carregandoCardapio => _carregandoCardapio;

  MenuProvider() {
    buscarCategorias();
    carregarItensDoCardapio();
    notifyListeners();
  }

  Future<void> buscarCategorias() async {
    try {
      _categorias = await _databaseService.getCategorias();
      if (_categorias.isNotEmpty && _categoriaSelecionadaId == null) {
        _categoriaSelecionadaId = _categorias.first['id'];
      }
    } catch (e) {
      _mensagemErro = "Erro ao buscar categorias: $e";
      _categorias = [];
    }
  }

  void selecionarCategoria(String categoriaId) {
    _categoriaSelecionadaId = categoriaId;
    _aplicarFiltroCardapio();
    notifyListeners();
  }

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
    List<MenuItemModel> itensTemporarios = List.from(_todosOsItensDoCardapio);

    if (_categoriaSelecionadaId != null &&
        _categoriaSelecionadaId!.isNotEmpty) {
      itensTemporarios =
          itensTemporarios.where((item) {
            return item.categoriaId == _categoriaSelecionadaId;
          }).toList();
    }

    if (_termoDeBuscaCardapio.isNotEmpty) {
      itensTemporarios =
          itensTemporarios.where((item) {
            final nomeItem = item.nome.toLowerCase();
            return nomeItem.contains(_termoDeBuscaCardapio);
          }).toList();
    }

    _itensFiltradosDoCardapio = itensTemporarios;
  }
}
