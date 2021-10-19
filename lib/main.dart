import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/size_config.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizeConfiguration(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Magazi',
        theme: AppTheme.light(),
        home: HomeScreen(),
        // home: const MagazineDetailScreen(),
      ),
    );
  }
}
