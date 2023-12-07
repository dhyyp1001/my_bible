import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible/screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            }),
      ),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    ),
  );
}
