
import 'package:flutter/material.dart';
import 'package:petshop/http/fornecedores_webclient.dart';
import 'package:petshop/model/fornecedor.dart';

class ListaFornecedores extends StatelessWidget {

  final List<Fornecedor> fornecedores = List();

  ListaFornecedores(){
    FornecedoresWebclient().buscaTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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