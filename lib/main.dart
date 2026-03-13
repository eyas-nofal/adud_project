import 'package:adud_project/screens/language/choose_language_screen.dart' show ChooseLanguageScreen;
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChooseLanguageScreen(
      
      ),
    );
  }
}
