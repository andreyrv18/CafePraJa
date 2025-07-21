import 'package:cafe_pra_ja/data/services/cupons_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CuponsRepository {
  final CuponsService _cuponsService;
  CuponsRepository(this._cuponsService);

  Stream<QuerySnapshot<Map<String, dynamic>>> getTodosCupons() {
    return _cuponsService.getTodosCupons();
  }

  // Stream<List<CuponsItemModel>> get cuponsStream {
  //   return _dbService.getTodosCupons().map((querySnapshot) {
  //     final List<CuponsItemModel> listaDeCupons =
  //     querySnapshot.docs.map((doc) {
  //       return CuponsItemModel.fromFirestore(doc);
  //     }).toList();
  //     return listaDeCupons;
  //   });
  // }
}