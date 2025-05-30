import 'package:flutter/foundation.dart';
import 'package:cafe_pra_ja/models/menu_item_model.dart';
import 'package:cafe_pra_ja/services/database_service.dart';

class MenuProvider with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  List<MenuItemModel> _menuItems = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<MenuItemModel> get menuItems => _menuItems;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> carregarItensDoCardapio() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _menuItems = await _databaseService.getTodosOsItensDoCardapio();
    } catch (e) {
      _errorMessage = "Erro ao carregar cardápio: ${e.toString()}";
      print("MenuProvider Erro: $_errorMessage");
      _menuItems = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
