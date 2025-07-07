import 'package:cafe_pra_ja/data/repositories/database_repository.dart';
import 'package:cafe_pra_ja/domain/models/cupons_item_model.dart';
import 'package:flutter/foundation.dart';

class CuponsProvider with ChangeNotifier {
  late final DatabaseRepository _dbService;

  CuponsProvider() : _dbService = DatabaseRepository();

  Stream<List<CuponsItemModel>> get cuponsStream {
    return _dbService.getTodosOsCuponsStream().map((querySnapshot) {
      final List<CuponsItemModel> listaDeCupons =
          querySnapshot.docs.map((doc) {
            return CuponsItemModel.fromFirestore(doc);
          }).toList();
      return listaDeCupons;
    });
  }
}
