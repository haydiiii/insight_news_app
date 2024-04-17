import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/core/utils/text_style.dart';
import 'package:insight_news_app/features/views/home/presentation/widgets/carousal_slider.dart';
import 'package:insight_news_app/features/views/home/presentation/widgets/home_header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/list_view_buil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final PageController _pageController;

  int currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                const HomeHeader(),
                CarousalSlider(onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 4,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                      spacing: 5,
                      radius: 6,
                      dotWidth: 12,
                      dotHeight: 12.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: AppColors.grey,
                      activeDotColor: AppColors.primary),
                ),
                const Gap(10),
                ButtonsTabBar(
                  // Customize the appearance and behavior of the tab bar
                  backgroundColor: AppColors.primary,
                  unselectedBackgroundColor: AppColors.cardColor,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  buttonMargin: const EdgeInsets.all(5),
                  labelStyle: getBodyStyle(color: AppColors.background),
                  unselectedLabelStyle: getBodyStyle(color: AppColors.white),
                  // Add your tabs here
                  tabs: const [
                    Tab(text: 'Science'),
                    Tab(text: 'Entertainment'),
                    Tab(text: 'Sports'),
                    Tab(text: 'business'),
                  ],
                ),
                const Expanded(
                  child: TabBarView(children: [
                    ListViewBuilder(
                      category: 'science',
                    ),
                    ListViewBuilder(
                      category: 'entertainment',
                    ),
                    ListViewBuilder(
                      category: 'sports',
                    ),
                    ListViewBuilder(
                      category: 'business',
                    ),
                  ]),
                ),
                // const Gap(30),

                //  BottomNavBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
