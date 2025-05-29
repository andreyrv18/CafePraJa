// providers/menu_provider.dart
import 'package:flutter/foundation.dart';
// Ajuste os caminhos para seus modelos e serviços
import 'package:cafe_pra_ja/models/menu_item_model.dart';
import 'package:cafe_pra_ja/services/database_service.dart';

class MenuProvider with ChangeNotifier {
  final DatabaseService _databaseService =
      DatabaseService(); // Instancia o serviço de banco de dados

  List<MenuItemModel> _menuItems = [];
  bool _isLoading = false;
  String? _errorMessage;

  // Getters para a UI acessar os dados e o estado
  List<MenuItemModel> get menuItems => _menuItems;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Método para carregar os itens do cardápio
  Future<void> carregarItensDoCardapio() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notifica a UI que o carregamento iniciou

    try {
      // Chama o método do DatabaseService que você forneceu
      _menuItems = await _databaseService.getTodosOsItensDoCardapio();
    } catch (e) {
      _errorMessage = "Erro ao carregar cardápio: ${e.toString()}";
      print("MenuProvider Erro: $_errorMessage"); // Log do erro
      _menuItems = []; // Garante que a lista esteja vazia em caso de erro
    } finally {
      _isLoading = false;
      notifyListeners(); // Notifica a UI que o carregamento terminou (com sucesso ou erro)
    }
  }

  // Opcional: Carregar os itens automaticamente quando o provider é criado.
  // Descomente a linha abaixo se quiser esse comportamento.
  // MenuProvider() {
  //   carregarItensDoCardapio();
  // }
}
