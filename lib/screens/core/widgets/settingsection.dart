import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/providers/language_provider.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/common/custom_flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildSettingsSection(
  BuildContext context,
  AppLocalizations l10n,
  bool isArabic,
) {
  return SettingsSection(l10n: l10n, isArabic: isArabic);
}

class SettingsSection extends StatefulWidget {
  final AppLocalizations l10n;
  final bool isArabic;

  const SettingsSection({
    super.key,
    required this.l10n,
    required this.isArabic,
  });

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  String accountType = 'شخص ذو إعاقة';
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    final isArabic = widget.isArabic;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.settings_outlined, color: AppColors.neutral700),
              const SizedBox(width: 10),
              Text(
                l10n.settings,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutral800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                // Language
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.language,
                            color: AppColors.neutral600,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            l10n.language,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.neutral800,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<LanguageProvider>().setLocale(
                                const Locale('ar'),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isArabic
                                    ? AppColors.primary500
                                    : AppColors.neutral100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                l10n.arabic,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isArabic
                                      ? Colors.white
                                      : AppColors.neutral600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              context.read<LanguageProvider>().setLocale(
                                const Locale('en'),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: !isArabic
                                    ? AppColors.primary500
                                    : AppColors.neutral100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                l10n.english,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: !isArabic
                                      ? Colors.white
                                      : AppColors.neutral600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(color: AppColors.neutral200),
                // Account Type
                InkWell(
                  onTap: () =>
                      showCustomFlushbar(context, l10n.editAccountType),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person_outline,
                              color: AppColors.neutral600,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              l10n.accountType,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.neutral800,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          accountType,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.neutral600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(color: AppColors.neutral200),
                // Notifications
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.notifications_none,
                            color: AppColors.neutral600,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            l10n.notifications,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.neutral800,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: notificationsEnabled,
                        onChanged: (val) {
                          setState(() {
                            notificationsEnabled = val;
                          });
                          showCustomFlushbar(
                            context,
                            notificationsEnabled
                                ? l10n.notificationsEnabled
                                : l10n.notificationsDisabled,
                          );
                        },
                        activeThumbColor: AppColors.success500,
                        activeTrackColor: AppColors.success200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
