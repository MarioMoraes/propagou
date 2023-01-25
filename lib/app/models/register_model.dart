// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterModel {
  final String nome;
  final String cep;

  RegisterModel({
    required this.nome,
    required this.cep,
  });

  RegisterModel copyWith({
    String? nome,
    String? cep,
  }) {
    return RegisterModel(
      nome: nome ?? this.nome,
      cep: cep ?? this.cep,
    );
  }
}
