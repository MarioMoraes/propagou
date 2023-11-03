import 'dart:convert';

class ProvedorModel {
  final int id;
  final String nome;
  final String cep;
  final String endereco;
  final String numero;
  final String bairro;
  final String cidade;
  final String doc;
  final String email;
  final String phoneNumber;
  final String instagram;
  final String facebook;
  final String servico;
  final String classificacao;

  ProvedorModel({
    required this.id,
    required this.nome,
    required this.cep,
    required this.endereco,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.doc,
    required this.email,
    required this.phoneNumber,
    required this.instagram,
    required this.facebook,
    required this.servico,
    required this.classificacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'cep': cep,
      'endereco': endereco,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
      'doc': doc,
      'email': email,
      'phoneNumber': phoneNumber,
      'instagram': instagram,
      'facebook': facebook,
      'servico': servico,
      'classificacao': classificacao,
    };
  }

  factory ProvedorModel.fromMap(Map<String, dynamic> map) {
    return ProvedorModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      cep: map['cep'] as String,
      endereco: map['endereco'] as String,
      numero: map['numero'] as String,
      bairro: map['bairro'] as String,
      cidade: map['cidade'] as String,
      doc: map['doc'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      instagram: map['instagram'] as String,
      facebook: map['facebook'] as String,
      servico: map['servico'] as String,
      classificacao: map['classificacao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProvedorModel.fromJson(String source) =>
      ProvedorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
