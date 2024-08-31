import 'package:dzien_dobry/consts/colors.dart';
import 'package:dzien_dobry/data/providers/providers_init.dart';
import 'package:dzien_dobry/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProvidersInit(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: MyColors.primary,
        indicatorColor: MyColors.primaryDark,
        cardColor: MyColors.primaryLight,
        scaffoldBackgroundColor: MyColors.background,
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontSize: 16,
          ),
          titleLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
      },
      initialRoute: '/',
    );
  }
}
