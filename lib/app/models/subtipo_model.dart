import 'dart:convert';

class SubTipoModel {
  String id;
  String grupoId;
  String grupo;

  SubTipoModel({
    required this.id,
    required this.grupoId,
    required this.grupo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'grupo_id': grupoId,
      'grupo': grupo,
    };
  }

  factory SubTipoModel.fromMap(Map<String, dynamic> map) {
    return SubTipoModel(
      id: map['id'] as String,
      grupoId: map['grupo_id'] as String,
      grupo: map['grupo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubTipoModel.fromJson(String source) =>
      SubTipoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
