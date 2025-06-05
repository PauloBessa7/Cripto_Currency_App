abstract interface class IEnvironmentHelper {
  String? get urlCurrencyJson;
}

final class EnvironmentHelper implements IEnvironmentHelper {
  const EnvironmentHelper();

  String get _urlBaseCoinMarketCapAPI => 'https://pro-api.coinmarketcap.com/v2';

  @override
  String get urlCurrencyJson =>
      '$_urlBaseCoinMarketCapAPI/cryptocurrency/quotes/latest?symbol=';
}
