import 'package:cafe_pra_ja/models/cupons_item_model.dart';
import 'package:cafe_pra_ja/services/database_service.dart';
import 'package:flutter/foundation.dart';

class CuponsProvider with ChangeNotifier {
  late DatabaseService _dbService;

  CuponsProvider() : _dbService = DatabaseService();

  Stream<List<CuponsItemModel>> get cuponsStream {
    return _dbService.getTodosOsCuponsStream().map((querySnapshot) {
      final List<CuponsItemModel> listaDeCupons =
          querySnapshot.docs.map((doc) {
            return CuponsItemModel.fromFirestore(doc);
          }).toList();
      print("💰 Cupons recebidos e mapeados: ${listaDeCupons.length} itens");
      return listaDeCupons;
    });
  }
}
