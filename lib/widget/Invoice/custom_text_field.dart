import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool showAddButton;
  final String? addButtonText;
  final VoidCallback? onAddTap;
  final bool hasInitialValue;
  final String? initialValue;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final Color? labelColor;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    this.showAddButton = false,
    this.addButtonText,
    this.onAddTap,
    this.hasInitialValue = false,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.readOnly = false,
    this.labelColor, 
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                label,
                style: GoogleFonts.abel(
                  fontSize: screenWidth * 0.035, 
                  color: labelColor ?? AppColors.hintTextColor
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (showAddButton)
              GestureDetector(
                onTap: onAddTap,
                child: Container(
                  height: screenHeight * 0.022,
                  width: screenWidth * 0.22,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      addButtonText ?? "",
                      style: GoogleFonts.abel(
                        fontSize: screenWidth * 0.02, 
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        TextFormField(
          controller: controller,
          initialValue: hasInitialValue && controller == null ? initialValue : null,
          readOnly: readOnly,
          onChanged: onChanged,
          style: GoogleFonts.abel(
            fontSize: screenWidth * 0.031,
            fontWeight: FontWeight.w400,
            height: 1.0,
            letterSpacing: 0.04 * screenWidth * 0.031,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            fillColor: AppColors.appBarColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: Color(0xFF333333), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: Color(0xFF333333), width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: Color(0xFF333333), width: 1),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04, 
              vertical: 0
            ),
            constraints: BoxConstraints(maxHeight: screenHeight * 0.047),
            suffixIcon: suffixIcon, 
          ),
        ),
      ],
    );
  }
}