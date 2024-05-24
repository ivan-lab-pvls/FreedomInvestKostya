import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallet_wizard_app/router/router.dart';
import 'package:wallet_wizard_app/screens/theme/colors.dart';
import 'package:wallet_wizard_app/screens/theme/textstyles.dart';
import 'package:wallet_wizard_app/widgets/action_button_widget.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLastPage = false;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.onboardingBackground,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 1;
              });
            },
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Your Personal Financial Assistant',
                      style: AppHeaderStyles.SemiBold32(AppColors.white),
                    ),
                    Text(
                      'This mobile app will help you easily and effectively manage your personal finances.',
                      style: AppTextStyles.Medium16(AppColors.white40),
                    ),
                    SizedBox(height: 30),
                    Image.asset('assets/images/onboarding/1.png'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Everything You Need - All in One App',
                      style: AppHeaderStyles.SemiBold32(AppColors.white),
                    ),
                    Text(
                      'Track your income and expenses, plan your budget, and get up-to-date information on currency and cryptocurrency exchange rates.',
                      style: AppTextStyles.Medium16(AppColors.white40),
                    ),
                    SizedBox(height: 30),
                    Image.asset('assets/images/onboarding/1.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
        text: isLastPage ? 'Get Started' : 'Next',
        onTap: () {
          isLastPage ? context.router.push(MainRoute()) :
          pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
        width: 370,
      ),
    );
  }
}
