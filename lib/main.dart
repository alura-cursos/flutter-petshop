import 'package:flutter/material.dart';

void main() => runApp(Petshop());

class Petshop extends StatelessWidget {

  final List<Fornecedor> fornecedores = List();

  Petshop() {
    fornecedores.add(Fornecedor('Gatitos SA', 'Ração'));
    fornecedores.add(Fornecedor('Catiorros', 'Higiene'));
    fornecedores.add(Fornecedor('Peixinhos', 'Aquários'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Petshop'),
        ),
        body: ListView.builder(
          itemCount: fornecedores.length,
          itemBuilder: (context, posicao) {
            Fornecedor fornecedor = fornecedores[posicao];
            return FornecedorCard(fornecedor);
          },
        ),
      ),
    );
  }
}

class FornecedorCard extends StatelessWidget {
  final Fornecedor fornecedor;

  FornecedorCard(this.fornecedor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                fornecedor.empresa,
                style: TextStyle(fontSize: 24),
              ),
              Text(
                fornecedor.categoria,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Fornecedor {
  final String empresa;
  final String categoria;

  Fornecedor(
    this.empresa,
    this.categoria,
  );

}
