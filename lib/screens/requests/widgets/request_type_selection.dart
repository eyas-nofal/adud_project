import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adud_project/l10n/app_localizations.dart';

enum RequestCategory { escort, transportation, groceries, university }

class RequestTypeSelection extends StatelessWidget {
  final RequestCategory? selectedCategory;
  final ValueChanged<RequestCategory> onCategorySelected;

  const RequestTypeSelection({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final List<Map<String, dynamic>> categories = [
      {
        'type': RequestCategory.escort,
        'title': loc.escort,
        'icon': Icons.people_outline,
      },
      {
        'type': RequestCategory.transportation,
        'title': loc.transportation,
        'icon': Icons.directions_car_outlined,
      },
      {
        'type': RequestCategory.groceries,
        'title': loc.buyingGroceries,
        'icon': Icons.shopping_bag_outlined,
      },
      {
        'type': RequestCategory.university,
        'title': loc.universityHelp,
        'icon': Icons.school_outlined,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.helpType,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D3748),
          ),
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 2.5,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            final isSelected = selectedCategory == cat['type'];

            return GestureDetector(
              onTap: () => onCategorySelected(cat['type']),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.withValues(alpha: 0.05) : Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: isSelected ? Colors.blue : const Color(0xFFE2E8F0),
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: [
                    if (!isSelected)
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      cat['icon'],
                      color: isSelected ? Colors.blue : const Color(0xFF4A5568),
                      size: 24.sp,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      cat['title'],
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected ? Colors.blue : const Color(0xFF4A5568),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
