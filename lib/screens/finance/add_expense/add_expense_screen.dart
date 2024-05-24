import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_wizard_app/models/finance_model.dart';
import 'package:wallet_wizard_app/router/router.dart';
import 'package:wallet_wizard_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:wallet_wizard_app/screens/theme/colors.dart';
import 'package:wallet_wizard_app/screens/theme/textstyles.dart';
import 'package:wallet_wizard_app/widgets/action_button_widget.dart';
import 'package:wallet_wizard_app/widgets/textfield_app_widget.dart';

@RoutePage()
class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  String selectedCategory = 'Procurement';

  final List<String> categories = [
    'Procurement',
    'Food',
    'Transport',
    'Rest',
    'Investment',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.background,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Expense',
                        style: AppHeaderStyles.Bold32(AppColors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.router.pop();
                        },
                        child: Text(
                          'Close',
                          style: AppTextStyles.Medium18(AppColors.orange),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  TextFieldAppWidget(
                      controller: nameController,
                      hintText: 'Name title',
                      title: 'Title'),
                  SizedBox(height: 20),
                  TextFieldAppWidget(
                      controller: amountController,
                      hintText: 'Amount Expense',
                      title: 'Amount (\$)'),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category',
                        style: AppTextStyles.Medium16(AppColors.white40),
                      ),
                      SizedBox(height: 7),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = categories[index];
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: selectedCategory == categories[index]
                                      ? AppColors.white40
                                      : AppColors.white10,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(32.0))),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/expense/${categories[index].toLowerCase()}.svg',
                                    color: selectedCategory == categories[index]
                                        ? AppColors.white
                                        : AppColors.white40,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      categories[index],
                                      style: AppTextStyles.Medium16(
                                          selectedCategory == categories[index]
                                              ? AppColors.white
                                              : AppColors.white40),
                                    ),
                                  ),
                                  selectedCategory == categories[index]
                                      ? Icon(
                                    Icons.check_circle,
                                    color: AppColors.white,
                                  )
                                      : Icon(
                                    Icons.circle,
                                    color: AppColors.white10,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 25),
                      ActionButtonWidget(
                        text: 'Done',
                        width: double.infinity,
                        onTap: () {
                          if (nameController.text.isNotEmpty &&
                              amountController.text.isNotEmpty &&
                              int.parse(amountController.text) != null) {
                            context.read<FinanceBloc>().add(AddOperationEvent(
                                operation: FinanceModel(
                                  amount: int.parse(amountController.text),
                                  name: nameController.text,
                                  type: selectedCategory,
                                  date: DateTime.now(),
                                  icon:
                                  'assets/images/expense/${selectedCategory.toLowerCase()}.svg',
                                  operationType: OperationType.expense,
                                )));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Operation created!',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            );
                            context.router.push(MainRoute());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Firstly, enter information',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
