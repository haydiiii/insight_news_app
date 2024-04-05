import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insight_news_app/core/constants/iamge_assets.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/core/utils/text_style.dart';
import 'package:insight_news_app/features/views/home/presentation/widgets/home_header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/list_view_buil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
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
                CarouselSlider.builder(
                    itemCount: 4,
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset(
                        ImagesAssets.carousal,
                        height: 200,
                      );
                    },
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    )),
                SmoothPageIndicator(
                  controller: PageController(
                    initialPage: currentIndex,
                  ),
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
                    Tab(text: 'Sports'),
                  ],
                ),
                const Expanded(
                  child: TabBarView(children: [
                    ListViewBuilder(),
                    ListViewBuilder(),
                    ListViewBuilder(),
                    ListViewBuilder(),
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
