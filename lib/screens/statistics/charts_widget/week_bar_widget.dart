import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wallet_wizard_app/screens/statistics/charts_data/week_bar_data.dart';
import 'package:wallet_wizard_app/screens/theme/colors.dart';
import 'package:wallet_wizard_app/widgets/app_container.dart';


class WeekChartWidget extends StatelessWidget {
  final List weekData;
  final double maxAmount;

  const WeekChartWidget({super.key, required this.weekData, required this.maxAmount});

  @override
  Widget build(BuildContext context) {
    WeekBarData weekBarData = WeekBarData(
        mondayAmount: weekData[0],
        tuesdayAmount: weekData[1],
        wednesdayAmount: weekData[2],
        thursdayAmount: weekData[3],
        fridayAmount: weekData[4],
        saturdayAmount: weekData[5],
        sundayAmount: weekData[6]);

    weekBarData.initializeWeekBarData();

    return Center(
      child: AppContainer(
        child: Container(
          height: 300,
          child: BarChart(
            BarChartData(
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                  show: true,
                  topTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true, getTitlesWidget: getBottomTiles))),
              maxY: 100,
              minY: 0,
              barGroups: weekBarData.weekBarData
                  .map(
                    (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y <= 0 ? 1 : data.y / maxAmount * 100,
                      color: AppColors.orange,
                      width: 30,
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                  ],
                ),
              )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

Widget getBottomTiles(double value, TitleMeta meta) {
  const style = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white40);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text('Mon', style: style);
      break;
    case 1:
      text = Text('Tue', style: style);
      break;
    case 2:
      text = Text('Wed', style: style);
      break;
    case 3:
      text = Text('Thr', style: style);
      break;
    case 4:
      text = Text('Fri', style: style);
      break;
    case 5:
      text = Text('Sat', style: style);
      break;
    case 6:
      text = Text('Sun', style: style);
      break;
    default:
      text = Text('', style: style);
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
