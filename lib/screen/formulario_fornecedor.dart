import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petshop/http/fornecedores_webclient.dart';
import 'package:petshop/model/fornecedor.dart';

class FormularioFornecedor extends StatefulWidget {
  @override
  _FormularioFornecedorState createState() => _FormularioFornecedorState();
}

class _FormularioFornecedorState extends State<FormularioFornecedor> {

  final TextEditingController _campoEmpresaController = TextEditingController();
  final TextEditingController _campoCategoriaController =
      TextEditingController();
  final TextEditingController _campoEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criando fornecedor',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Empresa',
              ),
              controller: _campoEmpresaController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Categoria',
              ),
              controller: _campoCategoriaController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
              controller: _campoEmailController,
              keyboardType: TextInputType.emailAddress,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    _salva();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _salva() async {
    var empresa = _campoEmpresaController.text;
    var categoria = _campoCategoriaController.text;
    var email = _campoEmailController.text;
    Fornecedor fornecedor = Fornecedor(empresa, categoria, email,);
    if(await FornecedoresWebclient().salva(fornecedor)){
      print('fornecedor salvo');
      return;
    }
    print('não foi possível salvar o fornecedor');
  }
}
