part of 'finance_bloc.dart';

@immutable
sealed class FinanceState {}

final class FinanceInitial extends FinanceState {}

final class LoadedFinanceInfoState extends FinanceState {
  final int balance;
  final int income;
  final int expenses;

  final List<FinanceModel> allOperations;

  LoadedFinanceInfoState(
      {required this.balance,
      required this.income,
      required this.expenses,
      required this.allOperations});
}

final class EmptyFinanceInfoState extends FinanceState {}
