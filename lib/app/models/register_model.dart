class RegisterModel {
  final String? nome;
  final String? cep;
  final String? endereco;
  final String? numero;
  final String? bairro;
  final String? cidade;
  final String? doc;
  final String? email;
  final String? phoneNumber;

  RegisterModel({
    this.nome,
    this.cep,
    this.endereco,
    this.numero,
    this.bairro,
    this.cidade,
    this.doc,
    this.email,
    this.phoneNumber,
  });

  RegisterModel copyWith({
    String? nome,
    String? cep,
    String? endereco,
    String? numero,
    String? bairro,
    String? cidade,
    String? doc,
    String? email,
    String? phoneNumber,
  }) {
    return RegisterModel(
      nome: nome ?? this.nome,
      cep: cep ?? this.cep,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      doc: doc ?? this.doc,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  String toString() {
    return 'RegisterModel(nome: $nome, cep: $cep, endereco: $endereco, numero: $numero, bairro: $bairro, cidade: $cidade, doc: $doc, email: $email, phoneNumber: $phoneNumber)';
  }
}
