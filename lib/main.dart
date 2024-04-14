import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insight_news_app/core/services/local_storage.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/features/manager/news_cubit.dart';
import 'package:insight_news_app/splashview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppLocalStorage().init();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: MaterialApp(
          theme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: AppColors.background,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false),
              scaffoldBackgroundColor: AppColors.background,
              appBarTheme: AppBarTheme(color: AppColors.background),
              fontFamily: GoogleFonts.poppins().fontFamily,
              inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.red),
                ),
              )),
          debugShowCheckedModeBanner: false,
          home: const SplashView()),
    );
  }
}
