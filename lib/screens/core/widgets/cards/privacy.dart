import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildOtherCards(BuildContext context, AppLocalizations l10n, bool isArabic) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          buildActionCard(
            title: l10n.privacyPolicy,
            onTap: () {},
          ),
          const SizedBox(height: 15),
          buildActionCard(
            title: l10n.termsAndConditions,
            onTap: () {},
          ),
          const SizedBox(height: 15),
          buildActionCard(
            title: l10n.helpSupport,
            onTap: () {},
            borderColor: AppColors.primary500,
          ),
          const SizedBox(height: 30),
          buildLogoutButton(l10n),
          const SizedBox(height: 20),
          Text(
            '${l10n.appName} ${isArabic ? 'النسخة' : 'Version'} 1.0.0',
            style: const TextStyle(
              color: AppColors.neutral500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
  Widget buildActionCard({
    required String title,
    required VoidCallback onTap,
    Color? borderColor,
  }) {
    return Semantics(
      button: true,
      label: title,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: borderColor != null ? Border.all(color: borderColor, width: 1.5) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.neutral800,
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: AppColors.neutral500,
              size: 20,
            )
          ],
        ),
      ),
      ),
    ); 
  }
  Widget buildLogoutButton(AppLocalizations l10n) {
    return Semantics(
      button: true,
      label: l10n.logout,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xFFFDECEE), // Light red background
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.logout,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFFD32F2F),
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.logout,
              color: Color(0xFFD32F2F),
              size: 22,
            ),
          ],
        ),
      ),
      ),
    );
  }