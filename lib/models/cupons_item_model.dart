import 'package:cloud_firestore/cloud_firestore.dart';

class CuponsItemModel {
  final String id;
  final String codigo;
  final int porcentagem;
  final String descricao;

  CuponsItemModel({
    required this.id,
    required this.codigo,
    required this.porcentagem,
    required this.descricao,
  });

  factory CuponsItemModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    Map<String, dynamic> data = doc.data()!;

    return CuponsItemModel(
      id: doc.id,
      codigo: data['codigo'] as String? ?? 'CÓDIGO INVÁLIDO',
      porcentagem: data['porcentagem'],
      descricao: data["descricao"],
    );
  }
}
