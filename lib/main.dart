import 'package:ai_clean_energy_operations_app/pages/layout.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'routes.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.system,
      builder:
          (light, dark) => GetMaterialApp(
            title: dotenv.env['APP_NAME'] ?? '',
            theme: light,
            darkTheme: dark,
            initialRoute: '/',
            getPages: routers,
            debugShowCheckedModeBanner: false,
          ),
    );
  }
}
