import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/common/custom_flushbar.dart';
import 'package:flutter/material.dart';

Widget buildHeader(BuildContext context, AppLocalizations l10n, bool isArabic) {
  String userName = 'احمد';
  String userRole = 'مستخدم';

  int completedActivities = 12;
  double userRating = 4.8;
  int thisMonthActivities = 5;


  return Stack(
    alignment: Alignment.topCenter,
    children: [
      // Gradient Background
      Container(
        height: 220,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary500, AppColors.secondary500],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 10),

                const SizedBox(width: 15),
                Text(
                  l10n.navProfile,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
        ),
      ),
      // Profile Card
      Container(
        margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            // Avatar
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [AppColors.primary300, AppColors.secondary300],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () => showCustomFlushbar(
                    context,
                    l10n.editProfilePicture,
                    success: true,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.primary500,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Name
            Text(
              userName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.neutral900,
              ),
            ),
            const SizedBox(height: 5),
            // Role
            Text(
              userRole,
              style: const TextStyle(fontSize: 14, color: AppColors.neutral500),
            ),
            const SizedBox(height: 20),
            const Divider(color: AppColors.neutral300),
            const SizedBox(height: 15),
            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatItem(
                  completedActivities.toString(),
                  l10n.completedActivity,
                  AppColors.primary600,
                ),
                Container(width: 1, height: 40, color: AppColors.neutral300),
                buildStatItem(
                  userRating.toString(),
                  l10n.rating,
                  AppColors.success500,
                ),
                Container(width: 1, height: 40, color: AppColors.neutral300),
                buildStatItem(
                  thisMonthActivities.toString(),
                  l10n.thisMonth,
                  AppColors.secondary500,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildStatItem(String value, String label, Color valueColor) {
  return Column(
    children: [
      Text(
        value,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: valueColor,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        label,
        style: const TextStyle(fontSize: 12, color: AppColors.neutral500),
      ),
    ],
  );
}

Widget buildStatsCards(
  BuildContext context,
  AppLocalizations l10n,
  bool isArabic,
) {
  int receivedHelpsCount = 12;
  int contributionHours = 24;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    child: Column(
      children: [
        InkWell(
          onTap: () => showCustomFlushbar(context, l10n.viewHelpsDetails),
          borderRadius: BorderRadius.circular(20),
          child: _buildInfoCard(
            title: l10n.receivedHelp,
            subtitle: isArabic
                ? '$receivedHelpsCount مرة'
                : '$receivedHelpsCount times',
            icon: Icons.favorite_border,
            iconColor: AppColors.primary500,
            iconBgColor: AppColors.primary100,
          ),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () =>
              showCustomFlushbar(context, l10n.viewContributionDetails),
          borderRadius: BorderRadius.circular(20),
          child: _buildInfoCard(
            title: l10n.contributionHours,
            subtitle: isArabic
                ? '$contributionHours ساعة'
                : '$contributionHours hours',
            icon: Icons.access_time,
            iconColor: AppColors.success600,
            iconBgColor: AppColors.success100,
          ),
        ),
      ],
    ),
  );
}

Widget _buildInfoCard({
  required String title,
  required String subtitle,
  required IconData icon,
  required Color iconColor,
  required Color iconBgColor,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutral800,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.neutral500,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
