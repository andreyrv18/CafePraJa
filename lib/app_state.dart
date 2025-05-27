import 'package:flutter/material.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  void init() {}
  var firestore = [
    {
      "categoriaInfo": {
        "idSugerido": "bebidas_quentes",
        "nome": "Bebidas Quentes",
      },
      "itensDaCategoria": [
        {"nome": "Café expresso (grãos selecionados)", "preco": 4.00},
        {"nome": "Café com leite (leite vaporizado)", "preco": 5.00},
        {"nome": "Cappuccino (tradicional/especial)", "preco": 6.50},
        {"nome": "Mocha", "preco": 7.00},
        {"nome": "Chá (importados/especiais)", "preco": 4.50},
        {"nome": "Chocolate quente (tipo europeu)", "preco": 6.50},
      ],
    },
    {
      "categoriaInfo": {"idSugerido": "bebidas_frias", "nome": "Bebidas Frias"},
      "itensDaCategoria": [
        {"nome": "Café gelado (com opções de xaropes)", "preco": 6.00},
        {"nome": "Chá gelado (artesanal/sabores diferenciados)", "preco": 5.00},
        {"nome": "Suco natural (frutas frescas/combinações)", "preco": 6.50},
        {"nome": "Suco detox/funcional", "preco": 7.50},
        {"nome": "Água mineral (linha premium/com gás)", "preco": 3.50},
        {"nome": "Refrigerante (lata)", "preco": 4.50},
        {"nome": "Energético (marcas conhecidas)", "preco": 8.00},
      ],
    },
    {
      "categoriaInfo": {"idSugerido": "salgados", "nome": "Salgados"},
      "itensDaCategoria": [
        {"nome": "Pão de queijo (tradicional/multigrãos)", "preco": 4.00},
        {"nome": "Coxinha (frango com catupiry/opções gourmet)", "preco": 6.00},
        {
          "nome": "Esfiha (carne de primeira/opções vegetarianas)",
          "preco": 6.00,
        },
        {"nome": "Empada (massa amanteigada/recheios nobres)", "preco": 5.50},
        {"nome": "Pastel assado (integral/recheios especiais)", "preco": 6.50},
        {
          "nome": "Misto quente (pão artesanal/queijo de qualidade)",
          "preco": 7.00,
        },
        {
          "nome": "Croissant recheado (queijo brie, peito de peru)",
          "preco": 7.50,
        },
        {"nome": "Quiche individual", "preco": 8.00},
      ],
    },
    {
      "categoriaInfo": {
        "idSugerido": "doces_e_sobremesas",
        "nome": "Doces e Sobremesas",
      },
      "itensDaCategoria": [
        {"nome": "Bolo (fatia generosa/caseiro)", "preco": 5.50},
        {"nome": "Brownie (com nozes/chocolate nobre)", "preco": 6.00},
        {"nome": "Torta doce (fatia/opções finas)", "preco": 7.00},
        {"nome": "Pudim (leite condensado artesanal)", "preco": 6.00},
        {"nome": "Mousse (sabores diferenciados)", "preco": 5.50},
        {"nome": "Cheesecake (fatia)", "preco": 8.00},
      ],
    },
    {
      "categoriaInfo": {"idSugerido": "lanches", "nome": "Lanches"},
      "itensDaCategoria": [
        {
          "nome": "Sanduíche natural (pão integral/ingredientes frescos)",
          "preco": 7.50,
        },
        {
          "nome": "Wrap integral (com proteína/opções vegetarianas)",
          "preco": 8.50,
        },
        {"nome": "Salada de frutas (com granola e mel/iogurte)", "preco": 6.50},
        {
          "nome": "Iogurte natural com frutas e granola especial",
          "preco": 6.00,
        },
        {
          "nome": "Tapioca recheada (gourmet/ingredientes selecionados)",
          "preco": 7.50,
        },
        {"nome": "Açaí na tigela (com acompanhamentos)", "preco": 9.00},
      ],
    },
    {
      "categoriaInfo": {
        "idSugerido": "itens_adicionais",
        "nome": "Itens adicionais",
      },
      "itensDaCategoria": [
        {"nome": "Barra de cereal (premium/proteica)", "preco": 4.00},
        {"nome": "Biscoito recheado (importado/diferenciado)", "preco": 3.50},
        {"nome": "Biscoito salgado (crackers especiais)", "preco": 3.50},
        {"nome": "Muffin (artesanal/sabores variados)", "preco": 5.00},
        {"nome": "Pão na chapa (com manteiga Aviação/similar)", "preco": 4.50},
        {
          "nome": "Queijo quente (com queijo prato de boa qualidade)",
          "preco": 6.00,
        },
      ],
    },
  ];

  var cartItems = [];
  void toggleCheckout(item) {
    if (cartItems.contains(item)) {
      cartItems.remove(item);
      print("Item Removido $item");
    } else {
      cartItems.add(item);
      print("Item adicionado $item");
    }
    notifyListeners();
  }
}
