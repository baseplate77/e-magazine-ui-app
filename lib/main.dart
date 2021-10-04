import 'package:e_magazine_ui/screen/magazine_detail/magazinbe_detail_screen.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/size_config.dart';

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
        title: 'Magazi',
        theme: AppTheme.light(),
        home: const MagazineDetailScreen(),
      ),
    );
  }
}
