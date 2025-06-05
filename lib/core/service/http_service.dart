import 'package:cripto_currency_app/domain/entities/core/http_response_entity.dart';
import 'package:http/http.dart' as http;

abstract interface class IHttpService {
  Future<HttpResponseEntity> get(String url, {String? apiKey});
}

final class HttpService implements IHttpService {
  @override
  Future<HttpResponseEntity> get(String url, {String? apiKey}) async {
    final response = await http.get(
      Uri.parse(url),
      headers: apiKey != null ? {'X-CMC_PRO_API_KEY': apiKey} : null,
    );

    print(response.body);

    return HttpResponseEntity(
      data: response.body,
      statusCode: response.statusCode,
    );
  }
}
