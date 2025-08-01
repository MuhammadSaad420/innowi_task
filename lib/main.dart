import 'package:flutter/material.dart';
import 'package:innowi_task/ui/resources/app_routes.dart';
import 'package:innowi_task/ui/resources/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
