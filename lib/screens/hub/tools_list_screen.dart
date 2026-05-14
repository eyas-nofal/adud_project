import 'package:flutter/material.dart';
import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary500.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: AppColors.primary100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.hourglass_empty_rounded,
                    size: 64,
                    color: AppColors.primary500,
                  ),
                ),
                const SizedBox(height: 32),
                
                Text(
                  l10n.comingSoon,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.neutral900,
                  ),
                ),
                const SizedBox(height: 16),
                
                Text(
                  l10n.pageNotAvailable,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: AppColors.neutral500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}