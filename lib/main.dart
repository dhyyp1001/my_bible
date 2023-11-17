import 'package:flutter/material.dart';
import 'package:my_bible/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform,PageTransitionsBuilder>{
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        }),
      ),
      home: HomeScreen(),
    ),
  );
}
