import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insight_news_app/core/constants/icon_assets.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.home)),
        BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.search)),
        BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.source)),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.profile),
        )
      ]),
    );
  }
}
