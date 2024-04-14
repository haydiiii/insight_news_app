import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/core/utils/text_style.dart';
import 'package:insight_news_app/features/manager/news_cubit.dart';
import 'package:insight_news_app/features/manager/news_state.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({
    super.key,
    required this.category,
  });
  final String category;

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  void initState() {
    context.read<NewsCubit>().getNewsByCategory(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (BuildContext context, state) {
        if (state is SuccessNewsByCategoryState) {
          final news = state.model.articles;
          return ListView.builder(
            itemCount: news?.length ?? 0, // Null check for news
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
                      child: Image.network(
                        news?[index].urlToImage ?? '', fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                              width: 150,
                              height: 100,
                              child: Icon(
                                Icons.error,
                                color: AppColors.grey,
                              ));
                        }, // Set a fixed width for the image
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
                            news?[index].title ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: getSmallStyle(color: AppColors.white),
                          ),
                          const SizedBox(
                              height: 10), // Replace Gap with SizedBox
                          Row(
                            children: [
                              Icon(
                                Icons.menu_rounded,
                                color: AppColors.white,
                                size: 14,
                              ),
                              const SizedBox(
                                  width: 5), // Replace Gap with SizedBox
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
        } else if (state is ErrorNewsByCategoryState) {
          return const Center(
            child: Text('Error !'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }
      },
    );
  }
}
