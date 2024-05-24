import 'package:flutter/material.dart';
import 'package:wallet_wizard_app/router/router.dart';

class WalletWizardApp extends StatelessWidget {
  WalletWizardApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
