import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart'; 
import 'package:adud_project/providers/language_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(), 
      child: const AppRoot(),
    ),
  );
}