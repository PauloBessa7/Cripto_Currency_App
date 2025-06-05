import 'package:cripto_currency_app/data/repositories/currency_repository.dart';
import 'package:flutter/material.dart';

import 'package:cripto_currency_app/configs/environment_helper.dart';
import 'package:cripto_currency_app/configs/factory_viewmodel.dart';
import 'package:cripto_currency_app/core/service/http_service.dart';
import 'package:cripto_currency_app/data/datasources/remote_datasource.dart';
import 'package:cripto_currency_app/ui/currency/viewmodel/currency_viewmodel.dart';

final class CurrencyFactoryViewmodel
    implements IFactoryViewModel<CurrencyViewmodel> {
  @override
  CurrencyViewmodel create(BuildContext context) {
    final IEnvironmentHelper environment = EnvironmentHelper();
    final IHttpService service = HttpService();
    final IRemoteDataSource dataSource = RemoteDatasource(service, environment);
    final ICurrencyRepository repository = CurrencyRepository(dataSource);
    return CurrencyViewmodel(repository);
  }

  @override
  void dispose(BuildContext context, CurrencyViewmodel viewModel) {
    viewModel.close();
  }
}
