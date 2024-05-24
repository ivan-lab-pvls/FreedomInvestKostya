import 'package:hive_flutter/hive_flutter.dart';

part 'finance_model.g.dart';

@HiveType(typeId: 0)
class FinanceModel {
  @HiveField(0)
  final int amount;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final OperationType operationType;
  @HiveField(3)
  final String icon;
  @HiveField(4)
  final String type;
  @HiveField(5)
  final DateTime date;

  FinanceModel(
      {required this.amount,
      required this.name,
      required this.operationType,
      required this.icon,
      required this.date,
      required this.type});
}

@HiveType(typeId: 1)
enum OperationType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}
