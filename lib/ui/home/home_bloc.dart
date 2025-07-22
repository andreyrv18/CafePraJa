import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/home/home_event.dart';
import 'package:cafe_pra_ja/ui/home/home_state.dart';
import 'package:flutter/cupertino.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) {
      emit(HomeLoadingState());

      try {


        emit(HomeSuccessState());
      } catch (e){
        debugPrint('$e');
      }
    });

    on<HomeLoadingEvent>((event, emit) {
     emit(HomeLoadingState());
    });

    on<HomeSuccessEvent>((event, emit) {
      emit(HomeSuccessState());
    });

    on<HomeErrorEvent>((event, emit) {
      emit(HomeErrorState(''));
    });

    on<HomeApplyFilterEvent>((event, emit) {

    });
  }
}

// List<ProductModel> _todosOsItensDoCardapio = [];
// List<ProductModel> _itensFiltradosDoCardapio = [];
// List<Map<String, dynamic>> _categorias = [];
// String? _mensagemErro;
// String _termoDeBuscaCardapio = '';
// bool _carregandoCardapio = false;
// String? _categoriaSelecionadaId;
//
// String? get categoriaSelecionadaId => _categoriaSelecionadaId;
//
// List<Map<String, dynamic>> get categorias => _categorias;
//
// List<ProductModel> get todosOsItensDoCardapioDEBUG =>
//     _todosOsItensDoCardapio;
//
// String? get errorMessage => _mensagemErro;
//
// List<ProductModel> get itensFiltradosDoCardapio => _itensFiltradosDoCardapio;
//
// String get termoDeBuscaCardapio => _termoDeBuscaCardapio;
//
// bool get carregandoCardapio => _carregandoCardapio;
//
// ProductModel? getItem(String id) {
//   try {
//     return _todosOsItensDoCardapio.firstWhere((item) => item.id == id);
//   } catch (e) {
//     debugPrint(e as String?);
//   }
//   return null;
// }
//
// Future<void> buscarCategorias() async {
//   try {
//     _categorias = await ProdutosRepository.getCategorias();
//     if (_categorias.isNotEmpty && _categoriaSelecionadaId == null) {
//       _categoriaSelecionadaId = _categorias.first['id'];
//     }
//   } catch (e) {
//     _mensagemErro = '${CafeString.erroAoBuscarCategorias}: $e';
//     _categorias = [];
//   }
// }
//
// void selecionarCategoria(String categoriaId) {
//   _categoriaSelecionadaId = categoriaId;
//   _aplicarFiltroCardapio();
//   notifyListeners();
// }
//
// Future<void> carregarItensDoCardapio() async {
//   if (_carregandoCardapio) return;
//   _carregandoCardapio = true;
//   _mensagemErro = null;
//   notifyListeners();
//
//   try {
//     _todosOsItensDoCardapio =
//     await _databaseService.getTodosProdutos();
//
//     _aplicarFiltroCardapio();
//   } catch (e) {
//     _mensagemErro = '${CafeString.erroAoCarregarCargaprio}: ${e.toString()}';
//     _todosOsItensDoCardapio = [];
//     _itensFiltradosDoCardapio = [];
//   } finally {
//     _carregandoCardapio = false;
//     notifyListeners();
//   }
// }
//
// void atualizarTermoBuscaCardapio(String novoTermo) {
//   _termoDeBuscaCardapio = novoTermo.trim().toLowerCase();
//   _aplicarFiltroCardapio();
//   notifyListeners();
// }
//
// void _aplicarFiltroCardapio() {
//   List<ProductModel> itensTemporarios = List.from(_todosOsItensDoCardapio);
//
//   if (_categoriaSelecionadaId != null &&
//       _categoriaSelecionadaId!.isNotEmpty) {
//     itensTemporarios =
//         itensTemporarios.where((item) {
//           return item.categoriaId == _categoriaSelecionadaId;
//         }).toList();
//   }
//
//   if (_termoDeBuscaCardapio.isNotEmpty) {
//     itensTemporarios =
//         itensTemporarios.where((item) {
//           final nomeItem = item.nome.toLowerCase();
//           return nomeItem.contains(_termoDeBuscaCardapio);
//         }).toList();
//   }
//
//   _itensFiltradosDoCardapio = itensTemporarios;
// }
