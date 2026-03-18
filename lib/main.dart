import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'language_provider.dart'; // تأكد أن اسم الملف هنا مطابق لاسم ملفك 
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
  ChangeNotifierProvider(
    create: (context) => LocalProvider(), // تأكد من الاسم هنا
    child: const AppRoot(),
  ),
);
}