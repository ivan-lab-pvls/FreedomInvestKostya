import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_wizard_app/screens/theme/colors.dart';
import 'package:wallet_wizard_app/screens/theme/textstyles.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: AppHeaderStyles.Bold32(AppColors.white),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.white10,
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const Readaed(
                                      link:
                                          'https://docs.google.com/document/d/1XGA14NQccRb4zmeC9cOS1jIisrVZZg148l7xxQKVCPg/edit?usp=sharing',
                                    )),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/settings/terms.svg'),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Terms of use',
                                  style:
                                      AppTextStyles.Medium16(AppColors.white),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.white40,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(height: 1, color: AppColors.white10),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const Readaed(
                                      link:
                                          'https://docs.google.com/document/d/1lpEwX7CaEyjYUMyqzggT65PRGQtf-sYlmZePdLtAG9c/edit?usp=sharing',
                                    )),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/settings/privacy.svg'),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Privacy Policy',
                                  style:
                                      AppTextStyles.Medium16(AppColors.white),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.white40,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(height: 1, color: AppColors.white10),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const Readaed(
                                      link:
                                          'https://forms.gle/7ScW5ukZ9c2TqfEG8',
                                    )),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/settings/support.svg'),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Support page',
                                  style:
                                      AppTextStyles.Medium16(AppColors.white),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.white40,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Readaed extends StatelessWidget {
  final String link;

  const Readaed({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(link)),
        ),
      ),
    );
  }
}
