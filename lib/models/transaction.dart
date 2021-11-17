import 'dart:core';

class Transaction {
  final String title;
  final String amount;
  final DateTime date;
  final bool isTopUp;

  Transaction(this.title, this.amount, this.date, this.isTopUp);

  compareTo(Transaction b) {}
}
