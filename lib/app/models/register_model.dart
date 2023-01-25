class RegisterModel {
  final String? nome;
  final String? cep;

  RegisterModel({
    this.nome,
    this.cep,
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
