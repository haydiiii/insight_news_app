import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insight_news_app/core/constants/icon_assets.dart';
import 'package:insight_news_app/core/utils/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.background,
          

          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.source), label: 'Source'),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.profile),
              label: 'Profile',
            )
          ]),
    );
  }
}
