import 'dart:convert';

import 'package:cripto_currency_app/configs/environment_helper.dart';
import 'package:cripto_currency_app/core/service/http_service.dart';
import 'package:cripto_currency_app/domain/entities/core/http_response_entity.dart';

abstract interface class IRemoteDataSource {
  Future<HttpResponseEntity> get(String currencies);
}

final class RemoteDatasource implements IRemoteDataSource {
  final IHttpService _httpService;
  final IEnvironmentHelper _environment;

  RemoteDatasource(this._httpService, this._environment);

  @override
  Future<HttpResponseEntity> get(String currencies) async {
    try {
      final response = await _httpService.get(
        '${_environment.urlCurrencyJson}$currencies',
        apiKey: 'e49f82cf-e539-4094-b31a-e19173bfffcc',
      );

      if (response.statusCode != 200) {
        return HttpResponseEntity(data: null, statusCode: response.statusCode);
      }

      final responseDecode = jsonDecode(response.data);

      print('Valor decodado: $responseDecode');

      return HttpResponseEntity(
        data: responseDecode,
        statusCode: response.statusCode,
      );
    } catch (e) {
      print(e.toString());
      return HttpResponseEntity(
        data: null,
        statusCode: 500,
      );
    }
  }
}
