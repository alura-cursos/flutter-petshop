import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:petshop/http/logging_interceptor.dart';
import 'package:petshop/model/fornecedor.dart';

class FornecedoresWebclient {
  final Client _client = HttpClientWithInterceptor.build(interceptors: [
    LoggingInterceptor(),
  ]);

  final Map<String, String> _headers = {
    'Accept': '*/*',
    'Content-Type': 'application/json',
  };
  final urlBase = 'http://172.17.98.1:3000/api/fornecedores';

  Future<Iterable<Fornecedor>> buscaTodos() {
    return _client.get(urlBase, headers: _headers).then((resposta) {
      List<dynamic> json = jsonDecode(resposta.body);
      Iterable<Fornecedor> fornecedores = json.map((dynamic elemento) {
        Map<String, dynamic> fornecedorMapeado = elemento;
        return Fornecedor(
          fornecedorMapeado['empresa'],
          fornecedorMapeado['categoria'],
        );
      });
      return fornecedores;
    });
  }

  Future<bool> salva(Fornecedor fornecedor) async {
    Map<String, dynamic> fornecedorMapeado = {
      'empresa': fornecedor.empresa,
      'categoria': fornecedor.categoria,
      'email': fornecedor.email,
    };

    var json = jsonEncode(fornecedorMapeado);
    Response resposta = await _client.post(
      urlBase,
      headers: _headers,
      body: json,
    );
    return resposta.statusCode == 201;
  }
}
