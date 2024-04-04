import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insight_news_app/core/constants/iamge_assets.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/core/utils/text_style.dart';
import 'package:insight_news_app/features/home/presentation/widgets/home_header.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const HomeHeader(),
              const Gap(20),
              Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          ImagesAssets.slider,
                        ),
                      ),
                      const Gap(30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(15),
                          Text(
                            ' Man city stay',
                            style: getBodyStyle(),
                          ),
                          const Gap(30),
                          Row(
                            children: [
                              Icon(
                                Icons.menu_rounded,
                                color: AppColors.white,
                              ),
                              const Gap(5),
                              Text(
                                'READ',
                                style: getSmallStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),

              //  BottomNavBar()
            ],
          ),
        ),
      ),
    );
  }
}
