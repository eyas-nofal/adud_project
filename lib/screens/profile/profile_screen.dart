import 'package:adud_project/screens/core/widgets/cards/privacy.dart';
import 'package:adud_project/screens/core/widgets/cards/settingheader.dart';
import 'package:adud_project/screens/core/widgets/settingsection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/providers/language_provider.dart';
import '../core/constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    final isArabic = languageProvider.locale.languageCode == 'ar';
    final l10n = AppLocalizations.of(context)!;

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.neutral100,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(context, l10n, isArabic),
              buildStatsCards(context, l10n, isArabic),
              buildSettingsSection(context, l10n, isArabic),
              const SizedBox(height: 15),
              buildOtherCards(context, l10n, isArabic),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
