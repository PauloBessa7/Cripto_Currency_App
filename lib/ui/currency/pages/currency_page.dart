import 'package:cripto_currency_app/domain/entities/core/request_state_entity.dart';
import 'package:cripto_currency_app/ui/currency/viewmodel/currency_factory_viewmodel.dart';
import 'package:cripto_currency_app/ui/currency/viewmodel/currency_viewmodel.dart';
import 'package:cripto_currency_app/ui/currency/widgets/details_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrencyViewmodel>(
      create: CurrencyFactoryViewmodel().create,
      child: _CurrencyPage(),
    );
  }
}

class _CurrencyPage extends StatefulWidget {
  const _CurrencyPage({super.key});

  @override
  State<_CurrencyPage> createState() => __CurrencyPageState();
}

class __CurrencyPageState extends State<_CurrencyPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    context.read<CurrencyViewmodel>().onGetListCriptoCurrency();
  }

  Future<void> _refresh() async {
    context.read<CurrencyViewmodel>().onGetListCriptoCurrency();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cripto Moedas')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Buscar moeda...',
                        border: OutlineInputBorder(),
                      ),
                      onChanged:
                          (value) => context
                              .read<CurrencyViewmodel>()
                              .onChangeCurrenciesTextFormField(value),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 156, 238, 136),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                      ),
                    ),
                    onPressed: () {
                      context
                          .read<CurrencyViewmodel>()
                          .onGetListCriptoCurrency();
                    },
                    icon: const Icon(Icons.search, color: Colors.black),
                    label: const Text(
                      'Procurar',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<CurrencyViewmodel, IRequestState>(
                builder: (context, state) {
                  if (state is RequestInitiationState) {
                    return Center(
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<CurrencyViewmodel>()
                              .onGetListCriptoCurrency();
                        },
                        child: const Text('Pegar lista de moedas'),
                      ),
                    );
                  }
                  if (state is RequestProcessingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is RequestErrorState) {
                    return Center(
                      child: Text(
                        'Erro ao pesquisar moedas, valide sua conexão com a internet ou use um padrão aceitável de pesquisa, como por exemplo: ADA,BTC',
                      ),
                    );
                  }
                  if (state is RequestCompletedState) {
                    final currencies = state.data;
                    if (currencies.isEmpty) {
                      return const Center(
                        child: Text('Nenhuma moeda encontrada.'),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: _refresh,
                      child: ListView.builder(
                        itemCount: currencies.length,
                        itemBuilder: (context, index) {
                          final currency = currencies[index];
                          return InkWell(
                            onTap: () {
                              detailsCurrency(context, currency);
                            },
                            child: Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currency.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Símbolo: ${currency.symbol}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Cotação USD: \$${currency.price.toStringAsFixed(8)}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const Center(child: Text('Estado não esperado'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
