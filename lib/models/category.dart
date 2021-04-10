import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String title;
  final String subtitle;
  final double amount;

  Category({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    @required this.amount,
  });
}
