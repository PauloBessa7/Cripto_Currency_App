import 'package:cripto_currency_app/data/datasources/remote_datasource.dart';
import 'package:cripto_currency_app/domain/entities/currency/currency_entity.dart';

abstract interface class ICurrencyRepository {
  Future<List<CriptoCurrency>> getListCurrency(String currencies);
}

final class CurrencyRepository implements ICurrencyRepository {
  final IRemoteDataSource _remoteDataSource;

  const CurrencyRepository(this._remoteDataSource);

  @override
  Future<List<CriptoCurrency>> getListCurrency(String currencies) async {
    final response = await _remoteDataSource.get(currencies);

    print('Reponse do data Decodado no Repositorio: ${response.data}');

    final responseData = response.data['data'] as Map<String, dynamic>;

    try {
      final List<CriptoCurrency> data =
          responseData.values
              .expand((list) => list as List)
              .where(
                // evitar ao maximo meme coins
                (e) =>
                    ((e as Map<String, dynamic>)['quote']?['USD']?['price'] ??
                        0) >
                    0.0001,
              )
              .map((e) => CriptoCurrency.fromMap(e as Map<String, dynamic>))
              .toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
