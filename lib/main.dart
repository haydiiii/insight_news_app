import 'package:flutter/material.dart';
import 'package:insight_news_app/core/services/local_storage.dart';
import 'package:insight_news_app/core/theme/theme_app.dart';
import 'package:insight_news_app/splashview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppLocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: applightmode,
        debugShowCheckedModeBanner: false,
        home: const SplashView());
  }
}
