class Fornecedor {
  final String empresa;
  final String categoria;
  final String email;

  Fornecedor(
    this.empresa,
    this.categoria, [
    this.email,
  ]);

  @override
  String toString() {
    return 'Fornecedor{empresa: $empresa, categoria: $categoria, email: $email}';
  }
}
