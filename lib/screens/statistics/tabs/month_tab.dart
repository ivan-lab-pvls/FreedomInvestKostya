import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_wizard_app/screens/statistics/charts_widget/month_bar_widget.dart';
import 'package:wallet_wizard_app/screens/statistics/statistics_bloc/statistics_bloc.dart';
import 'package:wallet_wizard_app/screens/theme/colors.dart';
import 'package:wallet_wizard_app/screens/theme/textstyles.dart';

class MonthTab extends StatefulWidget {
  const MonthTab({super.key});

  @override
  State<MonthTab> createState() => _MonthTabState();
}

class _MonthTabState extends State<MonthTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.background,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => StatisticsBloc()..add(GetMonthStatisticsEvent()),
            child: BlocConsumer<StatisticsBloc, StatisticsState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadedMonthStatisticsState) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        MonthChartWidget(
                            monthData: state.monthStatistics,
                            maxAmount: state.maxIncome),
                        SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.white10,
                              borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 16),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Income',
                                      style: AppTextStyles.Medium16(
                                          AppColors.white40),
                                    ),
                                    Text(
                                      '${state.totalIncome.toStringAsFixed(0)}\$',
                                      style:
                                      AppTextStyles.Medium16(AppColors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 1, color: AppColors.white10),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 16),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Expense',
                                      style: AppTextStyles.Medium16(
                                          AppColors.white40),
                                    ),
                                    Text(
                                      '${state.totalSpend.toStringAsFixed(0)}\$',
                                      style:
                                      AppTextStyles.Medium16(AppColors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.white10,
                              borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                          padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total amount',
                                style: AppTextStyles.Medium16(AppColors.white40),
                              ),
                              Text(
                                '${state.maxIncome.toStringAsFixed(0)}\$',
                                style: AppTextStyles.Medium16(AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
