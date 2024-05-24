
import 'package:flutter/material.dart';
import 'package:wallet_wizard_app/screens/theme/colors.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  const AppContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.white10,
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      child: child,
    );
  }
}