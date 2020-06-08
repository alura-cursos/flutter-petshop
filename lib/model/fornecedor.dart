class Fornecedor {
  final String empresa;
  final String categoria;

  Fornecedor(
    this.empresa,
    this.categoria,
  );

  @override
  String toString() {
    return 'Fornecedor{empresa: $empresa, categoria: $categoria}';
  }
}
