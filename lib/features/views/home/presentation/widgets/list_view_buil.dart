import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insight_news_app/core/functions/routing.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/core/utils/text_style.dart';
import 'package:insight_news_app/features/manager/news_cubit.dart';
import 'package:insight_news_app/features/manager/news_state.dart';
import 'package:insight_news_app/features/views/home/presentation/view/news_details_view.dart';

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
    // Fetch news data when the widget is built

    return BlocBuilder<NewsCubit, NewsStates>(builder: (context, state) {
      if (state is SuccessNewsByCategoryState) {
        var news = state.model.articles;
        return ListView.builder(
          itemCount: news?.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () async {
                  pushto(context, NewsDetailsView(model: news![index]));
                },
                child: Container(
                  height: 100,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          news?[index].urlToImage ?? '',
                          fit: BoxFit.cover,
                          height: 100,
                          width: 150,
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                                width: 150,
                                height: 100,
                                child: Icon(
                                  Icons.error,
                                  color: AppColors.grey,
                                ));
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              news?[index].title ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: getTitleStyle(),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.menu,
                                  color: AppColors.white,
                                  size: 14,
                                ),
                                const Gap(5),
                                Text(
                                  'Read',
                                  style: getSmallStyle(color: AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
        );
      } else if (state is ErrorNewsByCategoryState) {
        return const Center(
          child: Text('Error Occured !'),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        );
      }
    });
  }
}
