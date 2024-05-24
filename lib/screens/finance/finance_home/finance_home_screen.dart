import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_wizard_app/models/finance_model.dart';
import 'package:wallet_wizard_app/router/router.dart';
import 'package:wallet_wizard_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:wallet_wizard_app/screens/finance/widgets/course_tile.dart';
import 'package:wallet_wizard_app/screens/theme/colors.dart';
import 'package:wallet_wizard_app/screens/theme/textstyles.dart';
import 'package:wallet_wizard_app/services/crypto_compare_api.dart';
import 'package:wallet_wizard_app/widgets/app_container.dart';

@RoutePage()
class FinanceHomeScreen extends StatefulWidget {
  const FinanceHomeScreen({super.key});

  @override
  State<FinanceHomeScreen> createState() => _FinanceHomeScreenState();
}

class _FinanceHomeScreenState extends State<FinanceHomeScreen> {
  List<String> currencies = ['EUR', 'BTC', 'ETH', 'USDT'];
  Map<String, dynamic> prices = {};

  CryptoCompareAPI cryptoCompareAPI = CryptoCompareAPI();

  void fetchData() async {
    try {
      Map<String, dynamic> fetchedPrices =
          await cryptoCompareAPI.fetchPrices(currencies);
      setState(() {
        prices = fetchedPrices;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  bool showHistory = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: AppColors.background,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: SingleChildScrollView(
              child: BlocProvider(
                create: (context) => FinanceBloc()..add(GetFinanceInfoEvent()),
                child: BlocBuilder<FinanceBloc, FinanceState>(
                  builder: (context, state) {
                    if (state is EmptyFinanceInfoState) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your balance',
                                      style: AppTextStyles.Medium14(
                                          AppColors.white40),
                                    ),
                                    Text(
                                      '\$0',
                                      style:
                                          AppHeaderStyles.Bold32(AppColors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Income',
                                          style: AppTextStyles.Medium14(
                                              AppColors.white40),
                                        ),
                                        Text(
                                          '\$0',
                                          style: AppTextStyles.Medium16(
                                              AppColors.white),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Expense',
                                          style: AppTextStyles.Medium14(
                                              AppColors.white40),
                                        ),
                                        Text(
                                          '\$0',
                                          style: AppTextStyles.Medium16(
                                              AppColors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.router.push(AddIncomeRoute());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 7),
                                      decoration: BoxDecoration(
                                          color: AppColors.white10,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      child: Center(
                                        child: Text(
                                          'Add Income',
                                          style: AppTextStyles.Regular16(
                                              AppColors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.router.push(AddExpenseRoute());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 7),
                                      decoration: BoxDecoration(
                                          color: AppColors.white10,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      child: Center(
                                        child: Text(
                                          'Add Expense',
                                          style: AppTextStyles.Regular16(
                                              AppColors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            prices.isEmpty
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.orange),
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppContainer(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/images/elements/usd.svg'),
                                                    SizedBox(width: 6),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'USD',
                                                          style: AppTextStyles
                                                              .Medium18(AppColors
                                                                  .white),
                                                        ),
                                                        Text(
                                                          'Dollar',
                                                          style: AppTextStyles
                                                              .Medium14(AppColors
                                                                  .white40),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          'EUR',
                                                          style: AppTextStyles
                                                              .Medium18(AppColors
                                                                  .white),
                                                        ),
                                                        Text(
                                                          'Euro',
                                                          style: AppTextStyles
                                                              .Medium14(AppColors
                                                                  .white40),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 6),
                                                    SvgPicture.asset(
                                                        'assets/images/elements/eur.svg'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '\$1',
                                                      style:
                                                          AppTextStyles.Medium18(
                                                              AppColors.white),
                                                    ),
                                                    Text(
                                                      'USD',
                                                      style:
                                                          AppTextStyles.Medium14(
                                                              AppColors.white40),
                                                    ),
                                                  ],
                                                ),
                                                SvgPicture.asset(
                                                    'assets/images/elements/swap.svg'),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '€${prices['EUR']['PRICE'].toStringAsFixed(2)}',
                                                      style:
                                                          AppTextStyles.Medium18(
                                                              AppColors.white),
                                                    ),
                                                    Text(
                                                      'EUR',
                                                      style:
                                                          AppTextStyles.Medium14(
                                                              AppColors.white40),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CourseTile(
                                            iconPath:
                                                'assets/images/elements/btc.svg',
                                            course: 'BTC',
                                            name: 'Bitcoin',
                                            value:
                                                '\$${prices['BTC']['PRICE'].toStringAsFixed(2)}',
                                            percentage:
                                                '${prices['BTC']['CHANGEPCT24HOUR'].toStringAsFixed(2)}%',
                                          ),
                                          CourseTile(
                                            iconPath:
                                                'assets/images/elements/eth.svg',
                                            course: 'ETH',
                                            name: 'Ethereum',
                                            value:
                                                '\$${prices['ETH']['PRICE'].toStringAsFixed(2)}',
                                            percentage:
                                                '${prices['ETH']['CHANGEPCT24HOUR'].toStringAsFixed(2)}%',
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      CourseTile(
                                        iconPath:
                                            'assets/images/elements/usdt.svg',
                                        course: 'USDT',
                                        name: 'Tether',
                                        value:
                                            '\$${prices['USDT']['PRICE'].toStringAsFixed(2)}',
                                        percentage:
                                            '${prices['USDT']['CHANGEPCT24HOUR'].toStringAsFixed(2)}%',
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      );
                    } else if (state is LoadedFinanceInfoState) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your balance',
                                      style: AppTextStyles.Medium14(
                                          AppColors.white40),
                                    ),
                                    Text(
                                      '\$${state.balance}',
                                      style:
                                          AppHeaderStyles.Bold32(AppColors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Income',
                                          style: AppTextStyles.Medium14(
                                              AppColors.white40),
                                        ),
                                        Text(
                                          '\$${state.income}',
                                          style: AppTextStyles.Medium16(
                                              AppColors.white),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Expense',
                                          style: AppTextStyles.Medium14(
                                              AppColors.white40),
                                        ),
                                        Text(
                                          '\$${state.expenses}',
                                          style: AppTextStyles.Medium16(
                                              AppColors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.router.push(AddIncomeRoute());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 7),
                                      decoration: BoxDecoration(
                                          color: AppColors.white10,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      child: Center(
                                        child: Text(
                                          'Add Income',
                                          style: AppTextStyles.Regular16(
                                              AppColors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.router.push(AddExpenseRoute());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 7),
                                      decoration: BoxDecoration(
                                          color: AppColors.white10,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      child: Center(
                                        child: Text(
                                          'Add Expense',
                                          style: AppTextStyles.Regular16(
                                              AppColors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showHistory = false;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: showHistory
                                            ? AppColors.white10
                                            : AppColors.orange,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32.0))),
                                    child: Center(
                                      child: Text(
                                        'Exchange rates',
                                        style: AppTextStyles.Regular16(showHistory
                                            ? AppColors.white40
                                            : AppColors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showHistory = true;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: showHistory
                                            ? AppColors.orange
                                            : AppColors.white10,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32.0))),
                                    child: Center(
                                      child: Text(
                                        'History',
                                        style: AppTextStyles.Regular16(showHistory
                                            ? AppColors.white
                                            : AppColors.white40),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            prices.isEmpty
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.orange),
                                  )
                                : !showHistory
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppContainer(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/images/elements/usd.svg'),
                                                        SizedBox(width: 6),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'USD',
                                                              style: AppTextStyles
                                                                  .Medium18(
                                                                      AppColors
                                                                          .white),
                                                            ),
                                                            Text(
                                                              'Dollar',
                                                              style: AppTextStyles
                                                                  .Medium14(
                                                                      AppColors
                                                                          .white40),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              'EUR',
                                                              style: AppTextStyles
                                                                  .Medium18(
                                                                      AppColors
                                                                          .white),
                                                            ),
                                                            Text(
                                                              'Euro',
                                                              style: AppTextStyles
                                                                  .Medium14(
                                                                      AppColors
                                                                          .white40),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(width: 6),
                                                        SvgPicture.asset(
                                                            'assets/images/elements/eur.svg'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 15),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '\$1',
                                                          style: AppTextStyles
                                                              .Medium18(AppColors
                                                                  .white),
                                                        ),
                                                        Text(
                                                          'USD',
                                                          style: AppTextStyles
                                                              .Medium14(AppColors
                                                                  .white40),
                                                        ),
                                                      ],
                                                    ),
                                                    SvgPicture.asset(
                                                        'assets/images/elements/swap.svg'),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          '€${prices['EUR']['PRICE'].toStringAsFixed(2)}',
                                                          style: AppTextStyles
                                                              .Medium18(AppColors
                                                                  .white),
                                                        ),
                                                        Text(
                                                          'EUR',
                                                          style: AppTextStyles
                                                              .Medium14(AppColors
                                                                  .white40),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CourseTile(
                                                iconPath:
                                                    'assets/images/elements/btc.svg',
                                                course: 'BTC',
                                                name: 'Bitcoin',
                                                value:
                                                    '\$${prices['BTC']['PRICE'].toStringAsFixed(2)}',
                                                percentage:
                                                    '${prices['BTC']['CHANGEPCT24HOUR'].toStringAsFixed(2)}%',
                                              ),
                                              CourseTile(
                                                iconPath:
                                                    'assets/images/elements/eth.svg',
                                                course: 'ETH',
                                                name: 'Ethereum',
                                                value:
                                                    '\$${prices['ETH']['PRICE'].toStringAsFixed(2)}',
                                                percentage:
                                                    '${prices['ETH']['CHANGEPCT24HOUR'].toStringAsFixed(2)}%',
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          CourseTile(
                                            iconPath:
                                                'assets/images/elements/usdt.svg',
                                            course: 'USDT',
                                            name: 'Tether',
                                            value:
                                                '\$${prices['USDT']['PRICE'].toStringAsFixed(2)}',
                                            percentage:
                                                '${prices['USDT']['CHANGEPCT24HOUR'].toStringAsFixed(2)}%',
                                          ),
                                        ],
                                      )
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: state.allOperations.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                SizedBox(height: 10),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final FinanceModel operation =
                                              state.allOperations[index];
                                          return AppContainer(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      color: AppColors.orange,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  32.0))),
                                                  child: SvgPicture.asset(
                                                      operation.icon),
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        operation.name,
                                                        style: AppTextStyles
                                                            .Medium16(
                                                                AppColors.white),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        7),
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .white10,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            32.0))),
                                                            child: Text(
                                                              operation.type,
                                                              style: AppTextStyles
                                                                  .Medium14(
                                                                      AppColors
                                                                          .orange),
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        7),
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .white10,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            32.0))),
                                                            child: Text(
                                                              operation.type ==
                                                                      OperationType
                                                                          .income
                                                                  ? 'Income'
                                                                  : 'Expense',
                                                              style: AppTextStyles
                                                                  .Medium14(
                                                                      AppColors
                                                                          .white40),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  '\$${operation.amount}',
                                                  style: AppTextStyles.Medium18(
                                                      AppColors.white),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
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
        ),
      ),
    );
  }
}
