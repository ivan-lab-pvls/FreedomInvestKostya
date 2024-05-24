import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:wallet_wizard_app/models/finance_model.dart';

part 'finance_event.dart';
part 'finance_state.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  FinanceBloc() : super(FinanceInitial()) {
    on<GetFinanceInfoEvent>(_getFinanceInfoHandler);
    on<AddOperationEvent>(_addOperationHandler);
  }

  void _getFinanceInfoHandler(
      GetFinanceInfoEvent event, Emitter<FinanceState> emit) async {
    List<FinanceModel> finances = [];

    int balance = 0;
    int income = 0;
    int expenses = 0;

    final financeBox = Hive.box('finances');

    if (financeBox.isNotEmpty) {
      for (int i = 0; i < financeBox.length; i++) {
        finances.add(financeBox.getAt(i));
      }

      finances = finances.reversed.toList();

      for (FinanceModel operation in finances) {
        if (operation.operationType == OperationType.income) {
          income += operation.amount;
        } else {
          expenses += operation.amount;
        }
      }

      balance = income - expenses;

      emit(LoadedFinanceInfoState(
          balance: balance,
          income: income,
          expenses: expenses,
          allOperations: finances,
      ));
    } else {
      emit(EmptyFinanceInfoState());
    }
  }

  void _addOperationHandler(
      AddOperationEvent event, Emitter<FinanceState> emit) async {
    final financeBox = Hive.box('finances');
    financeBox.add(event.operation);
  }
}
