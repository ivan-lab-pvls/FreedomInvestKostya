part of 'finance_bloc.dart';

@immutable
sealed class FinanceEvent {}

class GetFinanceInfoEvent extends FinanceEvent {}

class AddOperationEvent extends FinanceEvent {
  final FinanceModel operation;

  AddOperationEvent({required this.operation});
}