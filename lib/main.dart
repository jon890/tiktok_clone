import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

import 'constants/sizes.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TikTok Clone',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: const Color(0xFFE9435A),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: const Color(0xFFE9435A),
            ),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: Sizes.size16 + Sizes.size2,
                    fontWeight: FontWeight.w600)),
            bottomAppBarTheme:
                const BottomAppBarTheme(surfaceTintColor: Colors.white)),
        home: const MainNavigationScreen());
  }
}
