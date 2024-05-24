part of 'statistics_bloc.dart';

@immutable
sealed class StatisticsEvent {}

class GetDayStatisticsEvent extends StatisticsEvent {}

class GetWeekStatisticsEvent extends StatisticsEvent {}

class GetMonthStatisticsEvent extends StatisticsEvent {}