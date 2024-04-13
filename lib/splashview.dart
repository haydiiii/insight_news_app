import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insight_news_app/core/constants/iamge_assets.dart';
import 'package:insight_news_app/core/functions/routing.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/core/utils/text_style.dart';
import 'package:insight_news_app/features/views/upload/presentation/view/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        pushWithReplacement(context, const UploadView());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagesAssets.logoApp),
            const Gap(57),
            Text(
              'Insights News',
              style: getBodyStyle(fontsize: 25),
            ),
            const Gap(24),
            Text(
              'Stay Informed, Anytime, Anywhere.',
              style: getSmallStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
