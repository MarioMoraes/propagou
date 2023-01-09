import 'dart:convert';

class TipoModel {
  String id;
  String descricao;

  TipoModel({
    required this.id,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descricao': descricao,
    };
  }

  factory TipoModel.fromMap(Map<String, dynamic> map) {
    return TipoModel(
      id: map['id'] as String,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TipoModel.fromJson(String source) =>
      TipoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
