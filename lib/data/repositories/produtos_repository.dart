import 'package:cafe_pra_ja/data/services/produtos_service.dart';
import 'package:cafe_pra_ja/domain/models/product_model.dart';

class ProdutosRepository {
  final ProdutosService _produtosService;
  ProdutosRepository(this._produtosService);

  // Todo fazer logica de cache
  Future<List<ProductModel>> getTodosProdutos() async {
    return _produtosService.getTodosProdutos();
  }
}