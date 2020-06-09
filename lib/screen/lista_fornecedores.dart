import 'package:flutter/material.dart';
import 'package:petshop/http/fornecedores_webclient.dart';
import 'package:petshop/model/fornecedor.dart';
import 'package:petshop/screen/formulario_fornecedor.dart';

class ListaFornecedores extends StatefulWidget {
  @override
  _ListaFornecedoresState createState() => _ListaFornecedoresState();
}

class _ListaFornecedoresState extends State<ListaFornecedores> {
  final List<Fornecedor> fornecedores = List();

  _ListaFornecedoresState() {
    _buscaTodos();
  }

  Future<void> _buscaTodos() {
    return FornecedoresWebclient().buscaTodos().then(
      (fornecedoresRecebidos) {
        fornecedores.clear();
        setState(() {
          fornecedores.addAll(fornecedoresRecebidos);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fornecedores'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return _buscaTodos();
        },
        child: ListView.builder(
          itemCount: fornecedores.length,
          itemBuilder: (context, posicao) {
            Fornecedor fornecedor = fornecedores[posicao];
            return FornecedorCard(fornecedor);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _vaiParaFormulario(context);
        },
      ),
    );
  }

  void _vaiParaFormulario(BuildContext context) async {
    bool precisaAtualizar = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => FormularioFornecedor(),
      ),
    );
    if (precisaAtualizar) {
      setState(() {
        _buscaTodos();
      });
    }
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
