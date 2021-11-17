import 'package:money_app/models/transaction.dart';

class TestData {
  final list = [
    Transaction(
      "eBay",
      "80.00",
      DateTime.fromMillisecondsSinceEpoch(1637016340000),
      false,
    ),
    Transaction(
      "Tesco",
      "59.00",
      DateTime.fromMillisecondsSinceEpoch(1637016340000),
      false,
    ),
    Transaction(
      "Tfl",
      "42.00",
      DateTime.fromMillisecondsSinceEpoch(1637102740000),
      false,
    ),
    Transaction(
      "Top up",
      "500.00",
      DateTime.fromMillisecondsSinceEpoch(1637102740000),
      true,
    ),
    Transaction(
      "Amazon",
      "70.00",
      DateTime.fromMillisecondsSinceEpoch(1636929940000),
      false,
    ),
    Transaction(
      "Virgin Mobile",
      "10.00",
      DateTime.fromMillisecondsSinceEpoch(1636929940000),
      false,
    ),
  ];
}
