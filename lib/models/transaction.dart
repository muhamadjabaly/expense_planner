import 'package:flutter/foundation.dart';

class Transactions {
  final String id;
  final String text;
  final double amount;
  final DateTime time;

  Transactions({
    @required this.id,
    @required this.text,
    @required this.amount,
    @required this.time,
  });
}
