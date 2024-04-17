import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:insight_news_app/core/constants/icon_assets.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/core/utils/text_style.dart';
import 'package:insight_news_app/features/manager/news_cubit.dart';
import 'package:insight_news_app/features/views/search/presentation/widgets/list_search_view.dart';

// ignore: must_be_immutable
class SearchView extends StatelessWidget {
  SearchView({super.key});
// ignore: non_constant_identifier_names
  var SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Find Your News',
                  style: getBodyStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.normal,
                      fontsize: 16),
                ),
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: SearchController,
                      style: getBodyStyle(color: AppColors.white),
                      decoration: InputDecoration(
                          hintText: 'Search News',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  const Gap(5),
                  SizedBox(
                    width: 55,
                    height: 60,
                    child: FloatingActionButton(
                        backgroundColor: AppColors.primary,
                        child: SvgPicture.asset(
                          AppIcons.search,
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          context
                              .read<NewsCubit>()
                              .getNewsBySearch(SearchController.text);
                        }),
                  )
                ],
              ),
              const Gap(15),
              const Expanded(child: ListSearchView())
            ],
          ),
        ),
      ),
    );
  }
}
