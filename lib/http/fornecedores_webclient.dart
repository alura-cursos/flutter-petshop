import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:petshop/http/logging_interceptor.dart';
import 'package:petshop/model/fornecedor.dart';

class FornecedoresWebclient {
  Future<Iterable<Fornecedor>> buscaTodos() {
    Client client = HttpClientWithInterceptor.build(interceptors: [
      LoggingInterceptor(),
    ]);

    Map<String, String> headers = {'Accept': '*/*'};

    return client
        .get(
      'http://172.17.98.1:3000/api/fornecedores',
      headers: headers,
    )
        .then((resposta) {
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
}
