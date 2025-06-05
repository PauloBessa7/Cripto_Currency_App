import 'package:cripto_currency_app/data/repositories/currency_repository.dart';
import 'package:cripto_currency_app/domain/entities/core/request_state_entity.dart';
import 'package:cripto_currency_app/domain/entities/currency/currency_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class CurrencyViewmodel
    extends Cubit<IRequestState<List<CriptoCurrency>>> {
  final ICurrencyRepository _repository;

  String currenciesTextFormField = '';

  CurrencyViewmodel(this._repository) : super(RequestInitiationState());

  void onGetListCriptoCurrency() async {
    try {
      _emitter(const RequestProcessingState());

      final List<CriptoCurrency> data;
      if (currenciesTextFormField.isNotEmpty) {
        data = await _repository.getListCurrency(currenciesTextFormField);
      } else {
        data = await _repository.getListCurrency(
          'BTC,ETH,SOL,BNB,BCH,MKR,AAVE,DOT,SUI,ADA,XRP,TIA,NEO,NEAR,PENDLE,RENDER,LINK,TON,XAI,SEI,IMX,ETHFI,UMA,SUPER,FET,USUAL,GALA,PAAL,AERO',
        );
      }

      _emitter(RequestCompletedState(value: data));
    } catch (e) {
      _emitter(RequestErrorState(error: e));
    }
  }

  void onChangeCurrenciesTextFormField(String value) {
    // boa pratica?
    currenciesTextFormField = value;
  }

  void _emitter(IRequestState<List<CriptoCurrency>> state) {
    if (isClosed) return;
    emit(state);
  }
}
