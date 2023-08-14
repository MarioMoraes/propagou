import 'dart:convert';

class TiposModel {
  String id;
  String descricao;

  TiposModel({
    required this.id,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descricao': descricao,
    };
  }

  factory TiposModel.fromMap(Map<String, dynamic> map) {
    return TiposModel(
      id: map['id'] as String,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TiposModel.fromJson(String source) =>
      TiposModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
