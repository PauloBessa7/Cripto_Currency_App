class CriptoCurrency {
  final String name;
  final String symbol;
  final DateTime dateAdded;
  final double price;

  CriptoCurrency({
    required this.name,
    required this.symbol,
    required this.dateAdded,
    required this.price,
  });

  factory CriptoCurrency.fromMap(Map<String, dynamic> map) {
    return CriptoCurrency(
      name: map['name'] ?? '',
      symbol: map['symbol'] ?? '',
      dateAdded: DateTime.tryParse(map['date_added'] ?? '') ?? DateTime(1970),
      price: (map['quote']?['USD']?['price'] ?? 0),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'symbol': symbol,
      'date_added': dateAdded.toIso8601String(),
      'price': price,
    };
  }
}