import 'package:cafe_pra_ja/domain/models/product_model.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutosService  {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getTodosProdutos() async {
    List<ProductModel> todosOsItens = [];
    try {
      QuerySnapshot<Map<String, dynamic>> categoriasSnapshot =
      await _db.collection('cardapio').get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> categoriaDoc
      in categoriasSnapshot.docs) {
        String categoriaId = categoriaDoc.id;
        QuerySnapshot<Map<String, dynamic>> itensSnapshot =
        await _db
            .collection('cardapio')
            .doc(categoriaId)
            .collection('itens')
            .get();
        for (QueryDocumentSnapshot<Map<String, dynamic>> itemDoc
        in itensSnapshot.docs) {
          todosOsItens.add(ProductModel.fromFirestore(itemDoc, categoriaId));
        }
      }
    } catch (e) {
      throw Exception('${CafeString.naoFoiPossivelCarregarOsItensDoCardapio}: $e');
    }
    return todosOsItens;
  }
}
