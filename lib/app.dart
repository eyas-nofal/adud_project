import 'package:adud_project/screens/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/language/choose_language_screen.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => AppRootState();

  static AppRootState? of(BuildContext context) =>
      context.findAncestorStateOfType<AppRootState>();
}

class AppRootState extends State<AppRoot> {
  Locale _locale = const Locale('ar'); 

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Adud Project',
          
          locale: _locale,
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          theme: ThemeData(
            textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme),
          ),

          home: const ChooseLanguageScreen(),
          
        );
      },
    );
  }
}