import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;
  final TextEditingController _dateController = TextEditingController();

  // Helper method to get responsive dimensions
  double getResponsiveHeight(BuildContext context, double baseHeight) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Base reference: Pixel 7 Pro (approximately 915 logical pixels height)
    const double baseScreenHeight = 915.0;
    
    // Calculate scale factor
    double scaleFactor = (screenHeight / baseScreenHeight);
    
    // Clamp the scale factor to prevent extreme scaling
    scaleFactor = scaleFactor.clamp(0.7, 1.3);
    
    return baseHeight * scaleFactor;
  }

  double getResponsiveWidth(BuildContext context, double baseWidth) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Base reference: Pixel 7 Pro (approximately 412 logical pixels width)
    const double baseScreenWidth = 412.0;
    
    double scaleFactor = (screenWidth / baseScreenWidth);
    scaleFactor = scaleFactor.clamp(0.7, 1.3);
    
    return baseWidth * scaleFactor;
  }

  double getResponsiveFontSize(BuildContext context, double baseFontSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double baseScreenWidth = 412.0;
    
    double scaleFactor = (screenWidth / baseScreenWidth);
    scaleFactor = scaleFactor.clamp(0.8, 1.2);
    
    return baseFontSize * scaleFactor;
  }

  @override
  void initState() {
    super.initState();
    // Initialize with current date
    selectedDate = DateTime.now();
    _dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.white,
              onPrimary: Colors.black,
              surface: Colors.grey[900]!, // Replace AppColors.appBarColor
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Colors.grey[900], // Replace AppColors.appBarColor
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end, // Align to bottom
      children: [
        Center( // Center horizontally
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Due Date",
                style: GoogleFonts.abel(
                  fontSize: getResponsiveFontSize(context, 14),
                  color: Colors.grey, // Replace AppColors.hintTextColor
                ),
              ),
              SizedBox(height: getResponsiveHeight(context, 8)),
              Container(
                width: getResponsiveWidth(context, 155),
                height: getResponsiveHeight(context, 39),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getResponsiveWidth(context, 35)),
                  color: Colors.grey[900], // Replace AppColors.appBarColor
                  border: Border.all(
                    color: Color(0xFF333333),
                    width: 1,
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.center, // Center text in TextField
                  controller: _dateController,
                  readOnly: true,
                  style: GoogleFonts.abel(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.48,
                    fontSize: getResponsiveFontSize(context, 14),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: getResponsiveWidth(context, 12), 
                      vertical: getResponsiveHeight(context, 10)
                    ),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: getResponsiveWidth(context, 20),
                    ),
                  ),
                  onTap: () => _selectDate(context),
                ),
              ),
            ],
          ),
        ),
        // Optional: Add some padding from bottom
      ],
    );
  }
}