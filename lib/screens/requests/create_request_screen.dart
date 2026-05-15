import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adud_project/l10n/app_localizations.dart';
import 'widgets/request_type_selection.dart';
import 'widgets/time_selection.dart';
import 'widgets/location_picker.dart';
import 'widgets/description_field.dart';
import 'widgets/submit_button.dart';

class CreateRequestScreen extends StatefulWidget {
  const CreateRequestScreen({super.key});

  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  RequestCategory? _selectedCategory;
  bool _isNowSelected = true;
  String? _selectedDuration;
  String? _selectedLocation;
  String? _selectedDate;
  String? _selectedTime;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitRequest() {
    // Basic validation
    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a request type")),
      );
      return;
    }
    
    // Process the submission logic here
    print("Submitted!");
    print("Category: $_selectedCategory");
    print("Time: ${_isNowSelected ? 'Now' : 'Later'}");
    print("Duration: $_selectedDuration");
    print("Location: $_selectedLocation");
    print("Description: ${_descriptionController.text}");
    
    // Show success dialog or pop
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    // Set default duration if not set
    _selectedDuration ??= loc.oneHour;

    // Check if form is valid enough to enable button
    final bool isFormValid = _selectedCategory != null;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC), // Light grayish-blue background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          loc.requestHelp,
          style: TextStyle(
            color: const Color(0xFF1A202C),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1A202C)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RequestTypeSelection(
                selectedCategory: _selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
              SizedBox(height: 30.h),
              
              TimeSelection(
                isNowSelected: _isNowSelected,
                onTimeTypeChanged: (isNow) {
                  setState(() {
                    _isNowSelected = isNow;
                  });
                },
                selectedDuration: _selectedDuration!,
                onDurationChanged: (duration) {
                  if (duration != null) {
                    setState(() {
                      _selectedDuration = duration;
                    });
                  }
                },
                selectedDate: _selectedDate,
                onDateTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedDate = "${picked.month}/${picked.day}/${picked.year}";
                    });
                  }
                },
                selectedTime: _selectedTime,
                onTimeTap: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedTime = picked.format(context);
                    });
                  }
                },
              ),
              SizedBox(height: 30.h),
              
              LocationPicker(
                selectedLocation: _selectedLocation,
                onTap: () {
                  // Simulate picking a location
                  setState(() {
                    _selectedLocation = "Amman, University Street"; // Dummy value
                  });
                },
              ),
              SizedBox(height: 30.h),
              
              DescriptionField(
                controller: _descriptionController,
              ),
              SizedBox(height: 40.h),
              
              SubmitButton(
                onPressed: isFormValid ? _submitRequest : null,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
