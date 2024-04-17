import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/features/manager/news_state.dart';

class SourceView extends StatelessWidget {
  const SourceView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder(
          builder: (BuildContext context, state) {
            if (state is SuccessNewsBySourceState) {
              var news = state.model.articles;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: news?.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(
                          10), // Adjust border radius as needed
                      border: Border.all(
                        width: 1, // Border width
                      ),
                    ),
                    height: 200,
                  );
                },
              );
            } else if (state is ErrorNewsBySourceState) {
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
          },
        ),
      ),
    );
  }
}
