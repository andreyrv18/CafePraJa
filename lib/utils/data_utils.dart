import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';

class DataUtils {
  // Imprime o alfabeto ABCDEFGHIJKLMNOPQRSTUVWXYZ
  String alfabetoMaiusculo() {
    String alfabeto = CafeString.empty;
    for (int i = 65; i <= 90; i++) {
      alfabeto += String.fromCharCode(i);
    }
    return alfabeto;
  }

  // Imprime o alfabeto abcdefghijklmnopqrstuvwxyz
  String alfabetoMinusculo() {
    String alfabeto = CafeString.empty;
    for (int i = 97; i <= 122; i++) {
      alfabeto += String.fromCharCode(i);
    }
    return alfabeto;
  }
}
