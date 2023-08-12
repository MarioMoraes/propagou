import 'dart:convert';

class TiposModel {
  String id;
  String descricao;
  String grupoId;
  String grupo;

  TiposModel({
    required this.id,
    required this.descricao,
    required this.grupoId,
    required this.grupo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descricao': descricao,
      'grupo_id': grupoId,
      'grupo': grupo,
    };
  }

  factory TiposModel.fromMap(Map<String, dynamic> map) {
    return TiposModel(
      id: map['id'] as String,
      descricao: map['descricao'] as String,
      grupoId: map['grupo_id'] as String,
      grupo: map['grupo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TiposModel.fromJson(String source) =>
      TiposModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
