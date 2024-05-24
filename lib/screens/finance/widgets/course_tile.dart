import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_wizard_app/screens/theme/colors.dart';
import 'package:wallet_wizard_app/screens/theme/textstyles.dart';
import 'package:wallet_wizard_app/widgets/app_container.dart';

class CourseTile extends StatelessWidget {
  final String iconPath;
  final String course;
  final String name;
  final String value;
  final String percentage;

  const CourseTile(
      {super.key,
      required this.iconPath,
      required this.course,
      required this.name,
      required this.value,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: AppContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(iconPath),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      course,
                      style: AppTextStyles.Medium18(AppColors.white),
                    ),
                    Text(
                      name,
                      style: AppTextStyles.Medium14(AppColors.white40),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              value,
              style: AppTextStyles.Medium18(AppColors.white),
            ),
            Text(
              percentage,
              style: AppTextStyles.Medium14(AppColors.white40),
            ),
          ],
        ),
      ),
    );
  }
}
