import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:wallet_wizard_app/screens/finance/add_expense/add_expense_screen.dart';
import 'package:wallet_wizard_app/screens/finance/add_income/add_income_screen.dart';
import 'package:wallet_wizard_app/screens/finance/finance_home/finance_home_screen.dart';
import 'package:wallet_wizard_app/screens/main/main_screen.dart';
import 'package:wallet_wizard_app/screens/onboarding/onboarding_screen.dart';
import 'package:wallet_wizard_app/screens/settings/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: FinanceHomeRoute.page),
    AutoRoute(page: AddIncomeRoute.page),
    AutoRoute(page: AddExpenseRoute.page),

  ];
}