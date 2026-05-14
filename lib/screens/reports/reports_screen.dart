import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final TextEditingController _placeNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  final List<String> _selectedProblems = [];

  bool get _isFormValid =>
      _placeNameController.text.isNotEmpty &&
      _locationController.text.isNotEmpty &&
      _selectedProblems.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _placeNameController.addListener(() => setState(() {}));
    _locationController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _placeNameController.dispose();
    _locationController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  void _toggleProblem(String problem) {
    setState(() {
      if (_selectedProblems.contains(problem)) {
        _selectedProblems.remove(problem);
      } else {
        _selectedProblems.add(problem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final problemTypes = [
      l10n.problemType1,
      l10n.problemType2,
      l10n.problemType3,
    ];

    return Scaffold(
      backgroundColor: AppColors.primary50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.neutral900),
        title: Column(
          children: [
            Text(
              l10n.reportInaccessiblePlace,
              style: TextStyle(
                color: AppColors.neutral900,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              l10n.improveAccessibility,
              style: TextStyle(
                color: AppColors.neutral500,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info Box
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.primary300),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: AppColors.primary600, size: 24.sp),
                        SizedBox(width: 10.w),
                        Text(
                          l10n.reportHelpInfoTitle,
                          style: TextStyle(
                            color: AppColors.primary700,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    _buildInfoBulletItem(l10n.reportHelpInfo1),
                    SizedBox(height: 4.h),
                    _buildInfoBulletItem(l10n.reportHelpInfo2),
                    SizedBox(height: 4.h),
                    _buildInfoBulletItem(l10n.reportHelpInfo3),
                  ],
                ),
              ),
              
              SizedBox(height: 24.h),

              // Place Name
              _buildLabel(l10n.placeNameLabel),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: _placeNameController,
                hintText: l10n.placeNameHint,
              ),

              SizedBox(height: 20.h),

              // Location
              _buildLabel(l10n.locationLabel),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: _locationController,
                hintText: l10n.locationHint,
                suffixIcon: Icon(Icons.location_on_outlined, color: AppColors.neutral500),
              ),
              SizedBox(height: 8.h),
              InkWell(
                onTap: () {
                  // TODO: Get current location
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.my_location, color: AppColors.primary600, size: 16.sp),
                    SizedBox(width: 6.w),
                    Text(
                      l10n.useCurrentLocation,
                      style: TextStyle(
                        color: AppColors.primary600,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Problem Type
              _buildLabel(l10n.problemTypeLabel),
              SizedBox(height: 8.h),
              ...problemTypes.map((problem) => _buildProblemTypeOption(problem)),

              SizedBox(height: 24.h),

              // Additional Details
              _buildLabel(l10n.additionalDetailsLabel),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: _detailsController,
                hintText: l10n.additionalDetailsHint,
                maxLines: 4,
                suffixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 50.h),
                  child: Icon(Icons.description_outlined, color: AppColors.neutral500),
                ),
              ),

              SizedBox(height: 40.h),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _isFormValid ? () {
                    // TODO: Submit report
                    Navigator.pop(context);
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isFormValid ? AppColors.primary500 : AppColors.neutral300,
                    disabledBackgroundColor: AppColors.neutral300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    l10n.submitReport,
                    style: TextStyle(
                      color: _isFormValid ? Colors.white : AppColors.neutral500,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBulletItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(color: AppColors.primary600, fontSize: 16.sp, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.primary600,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.neutral700,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    Widget? suffixIcon,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.neutral300),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.neutral400, fontSize: 14.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }

  Widget _buildProblemTypeOption(String text) {
    final isSelected = _selectedProblems.contains(text);
    return GestureDetector(
      onTap: () => _toggleProblem(text),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.primary500 : AppColors.neutral300,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.neutral700,
                  fontSize: 14.sp,
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? AppColors.primary500 : AppColors.neutral300,
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
