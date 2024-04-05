import 'package:flutter/material.dart';
import 'package:insight_news_app/core/constants/iamge_assets.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/core/utils/text_style.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          height: 120, // Increase the height to accommodate content
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              ClipRRect(
                child: Image.asset(
                  ImagesAssets.slider,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100, // Set a fixed width for the image
                ),
              ),
              const SizedBox(width: 20), // Replace Gap with SizedBox
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Change to center
                  children: [
                    Text(
                      'Man city stayjghklo iuytredfg hyjuiopo9iuytyjuiopi87uytrthyuiuyt',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: getSmallStyle(color: AppColors.white),
                    ),
                    const SizedBox(height: 10), // Replace Gap with SizedBox
                    Row(
                      children: [
                        Icon(
                          Icons.menu_rounded,
                          color: AppColors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 5), // Replace Gap with SizedBox
                        Text(
                          'READ',
                          style: getSmallStyle(
                            fontsize: 12,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
