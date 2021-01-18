import 'package:dio/dio.dart';
import 'package:mobile/shared/urls.dart';

class RepositoryShared {
  Dio _dio;
  Response _response;

  RepositoryShared() {
    this._dio = Dio();
  }

  Future<bool> verificar_login() async {
    print('logar');

    _response = await this._dio.get(url_usuario);
    return this._response.data[0]['logado'];
  }
}
