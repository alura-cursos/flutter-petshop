import 'package:flutter/material.dart';

void main() => runApp(Petshop());

class Petshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Petshop'),
        ),
      ),
    );
  }
}
