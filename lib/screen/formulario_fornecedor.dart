import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioFornecedor extends StatelessWidget {
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
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Categoria',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Salvar'),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
