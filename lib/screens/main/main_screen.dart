import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_wizard_app/screens/finance/finance_home/finance_home_screen.dart';
import 'package:wallet_wizard_app/screens/settings/settings_screen.dart';
import 'package:wallet_wizard_app/screens/statistics/statistics_screen.dart';
import 'package:wallet_wizard_app/screens/theme/colors.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
  final _tabs = [FinanceHomeScreen(), StatisticsScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: _tabs[_currentIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            iconTheme: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return IconThemeData(color: AppColors.white);
              } else {
                return IconThemeData(color: AppColors.white40);
              }
            }),
            labelTextStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white);
              }
              return TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white40);
            }),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedIndex: _currentIndex,
            backgroundColor: AppColors.navBar ,
            indicatorColor: Colors.transparent,
            destinations: [
              NavigationDestination(
                selectedIcon: SvgPicture.asset('assets/images/tab-icons/home.svg', color: AppColors.white),
                icon: SvgPicture.asset('assets/images/tab-icons/home.svg', color: AppColors.white40),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset('assets/images/tab-icons/activities.svg', color: AppColors.white),
                icon: SvgPicture.asset('assets/images/tab-icons/activities.svg', color: AppColors.white40),
                label: 'Activities',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset('assets/images/tab-icons/settings.svg', color: AppColors.white),
                icon: SvgPicture.asset('assets/images/tab-icons/settings.svg', color: AppColors.white40),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
