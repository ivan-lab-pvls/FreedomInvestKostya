import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_wizard_app/screens/statistics/tabs/day_tab.dart';
import 'package:wallet_wizard_app/screens/statistics/tabs/month_tab.dart';
import 'package:wallet_wizard_app/screens/statistics/tabs/week_tab.dart';
import 'package:wallet_wizard_app/screens/theme/colors.dart';
import 'package:wallet_wizard_app/screens/theme/textstyles.dart';

@RoutePage()
class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: AppColors.orange,
              labelColor: AppColors.orange,
              unselectedLabelColor: AppColors.white40,
              tabs: [
                Tab(
                    child: Text(
                  'Today',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                )),
                Tab(
                    child: Text(
                  'Week',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                )),
                Tab(
                    child: Text(
                  'Month',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                )),

              ],
            ),
            elevation: 0,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Activities',
                style: AppHeaderStyles.Bold32(AppColors.white),
              ),
            )),
        body: TabBarView(
          children: [
            DayTab(),
            WeekTab(),
            MonthTab(),
          ],
        ),
      ),
    );
  }
}
