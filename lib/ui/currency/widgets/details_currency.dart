import 'package:cripto_currency_app/domain/entities/currency/currency_entity.dart';
import 'package:flutter/material.dart';

Future<dynamic> detailsCurrency(
  BuildContext context,
  CriptoCurrency currency,
) async {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
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
                'Símbolo:\t${currency.symbol}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Cotação USD:\t\$${currency.price.toStringAsFixed(5)}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Cotação BRL:\tR\$${((currency.price) * 5.6).toStringAsFixed(5)}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Adicionado no dia:\t${currency.dateAdded.day}/${currency.dateAdded.month}/${currency.dateAdded.year}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    },
  );
}
