part of 'statistics_bloc.dart';

@immutable
abstract class StatisticsState {}

class StatisticsInitial extends StatisticsState {}

class LoadedDayStatisticsState extends StatisticsState {
  final List<double> dayStatistics;
  final double maxIncome;
  final double totalIncome;
  final double totalSpend;

  LoadedDayStatisticsState(
      {required this.dayStatistics,
        required this.maxIncome,
        required this.totalIncome,
        required this.totalSpend});
}

class LoadedWeekStatisticsState extends StatisticsState {
  final List<double> weekStatistics;
  final double maxIncome;
  final double totalIncome;
  final double totalSpend;

  LoadedWeekStatisticsState(
      {required this.weekStatistics,
        required this.maxIncome,
        required this.totalIncome,
        required this.totalSpend});
}

class LoadedMonthStatisticsState extends StatisticsState {
  final List<double> monthStatistics;
  final double maxIncome;
  final double totalIncome;
  final double totalSpend;

  LoadedMonthStatisticsState(
      {required this.monthStatistics,
        required this.maxIncome,
        required this.totalIncome,
        required this.totalSpend});
}
