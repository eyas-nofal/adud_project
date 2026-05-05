import 'package:adud_project/screens/auth/welcome_screen.dart';
import 'package:adud_project/screens/home/disability_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/language/choose_language_screen.dart';
import 'package:adud_project/providers/language_provider.dart'; 

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Adud Project',
          
          locale: languageProvider.locale, 

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

          home: const WelcomeScreen(),
        );
      },
    );
  }
}