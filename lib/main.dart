import 'package:flutter/material.dart';
import 'package:petshop/screen/formulario_fornecedor.dart';

import 'screen/lista_fornecedores.dart';

void main() => runApp(Petshop());

class Petshop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormularioFornecedor(),
    );
  }
}

