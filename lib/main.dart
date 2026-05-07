import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart'; 
import 'package:adud_project/providers/language_provider.dart';
// تأكد من استيراد ملف الـ NavigationProvider الخاص بك
import 'package:adud_project/providers/navigation_provider.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()), 
        
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(userRole: UserRole.disabled),
        ),
      ],
      child: const AppRoot(),
    ),
  );
}