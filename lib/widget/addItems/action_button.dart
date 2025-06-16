import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';
import 'package:style__check/widget/Invoice/custom_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildButton("Save & New", screenWidth, screenHeight),
        SizedBox(width: screenWidth * 0.025), // Responsive spacing
        _buildButton("Save", screenWidth, screenHeight),
      ],
    );
  }

  Widget _buildButton(String text, double screenWidth, double screenHeight) {
    return CustomButton(
      text: text,
      width: screenWidth * 0.425, // Responsive width (42.5% of screen width)
      height: screenHeight * 0.042, // Responsive height (4.2% of screen height)
      borderColor: AppColors.border,
      textStyle: GoogleFonts.abel(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: screenWidth * 0.035, // Responsive font size
      ),
    );
  }
}