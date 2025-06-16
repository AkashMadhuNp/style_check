import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';
import 'package:style__check/widget/Invoice/custom_button.dart';

class SaveButtons extends StatelessWidget {
  const SaveButtons({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Calculate responsive values
    final responsiveHorizontalPadding = screenWidth * 0.067; // ~25px responsive
    final responsiveButtonHeight = screenHeight * 0.043; // ~35px responsive
    final responsiveSpacing = screenWidth * 0.027; // ~10px responsive
    final responsiveSvgWidth = screenWidth * 0.152; // ~57px responsive
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveHorizontalPadding),
      child: Row(
        children: [
          CustomButton(
            text: "Save & New",
            width: screenWidth * 0.380,
            height: responsiveButtonHeight,
            borderColor: Color(0xFF333333),
            textStyle: GoogleFonts.abel(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: screenWidth * 0.032, // ~12px responsive
            ),
          ),
          
          SizedBox(width: responsiveSpacing),
          
          CustomButton(
            text: "Save",
            width: screenWidth * 0.280,
            height: responsiveButtonHeight,
            borderColor: Color(0xFF333333),
            textStyle: GoogleFonts.abel(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: screenWidth * 0.032, // ~12px responsive
            ),
          ),
          
          SizedBox(width: responsiveSpacing),
          
          SvgPicture.asset(
            "assets/save.svg", 
            height: responsiveButtonHeight, 
            width: responsiveSvgWidth
          ),
        ],
      ),
    );
  }
}