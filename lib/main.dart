import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wallet_wizard_app/models/finance_model.dart';
import 'package:wallet_wizard_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:wallet_wizard_app/screens/statistics/statistics_bloc/statistics_bloc.dart';
import 'package:wallet_wizard_app/wallet_wizard_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  Hive.registerAdapter(FinanceModelAdapter());
  Hive.registerAdapter(OperationTypeAdapter());
  await Hive.openBox('finances');

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<FinanceBloc>(create: (context) => FinanceBloc()),
        BlocProvider<StatisticsBloc>(create: (context) => StatisticsBloc()),

      ],
      child: WalletWizardApp()));
}
