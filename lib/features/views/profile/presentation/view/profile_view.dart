import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insight_news_app/core/constants/iamge_assets.dart';
import 'package:insight_news_app/core/services/local_storage.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/core/utils/text_style.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var image = AppLocalStorage.getCashData('image') ?? '';
    var name = AppLocalStorage.getCashData('name') ?? '';

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile '),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: Image.file(
                      File(image),
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          ImagesAssets.user,
                          width: 50,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                          radius: 20,
                          foregroundColor: AppColors.primary,
                          child: const Icon(Icons.camera_alt_rounded)),
                    ),
                  )
                ],
              ),
              const Gap(30),
              Divider(
                color: AppColors.primary,
              ),
              const Gap(30),
              Row(
                children: [
                  Text(
                    name,
                    style: getTitleStyle(color: AppColors.primary),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.primary,
                      child: CircleAvatar(
                          radius: 17,
                          foregroundColor: AppColors.primary,
                          child: const Icon(Icons.edit)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
