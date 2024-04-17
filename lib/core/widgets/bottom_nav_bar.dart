import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insight_news_app/core/constants/icon_assets.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/features/views/home/presentation/view/home_view.dart';
import 'package:insight_news_app/features/views/profile/presentation/view/profile_view.dart';
import 'package:insight_news_app/features/views/search/presentation/view/search_view.dart';
import 'package:insight_news_app/features/views/source/presentation/view/source_view.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  List<Widget> views = [
    const HomeView(),
     SearchView(),
    const SourceView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(AppIcons.home,
                    colorFilter:
                        ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
                icon: SvgPicture.asset(AppIcons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(AppIcons.search,
                    colorFilter:
                        ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
                icon: SvgPicture.asset(AppIcons.search),
                label: 'Search'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(AppIcons.source,
                    colorFilter:
                        ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
                icon: SvgPicture.asset(AppIcons.source),
                label: 'Source'),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(AppIcons.profile,
                  colorFilter:
                      ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
              icon: SvgPicture.asset(AppIcons.profile),
              label: 'Profile',
            )
          ]),
    );
  }
}
