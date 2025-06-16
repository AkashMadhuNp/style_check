import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class DiscountInputRow extends StatelessWidget {
  const DiscountInputRow({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    return Row(
      children: [
        Text(
          "Discount",
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w400,
            fontSize: screenWidth * 0.035, 
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(width: screenWidth * 0.075), 
        Container(
          width: screenWidth * 0.300, 
          height: screenHeight * 0.047, 
          child: TextFormField(
            style: GoogleFonts.abel(
              fontSize: screenWidth * 0.03, 
              fontWeight: FontWeight.w400,
              height: 1.0,
              letterSpacing: 0.04 * screenWidth * 0.03,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              fillColor: AppColors.appBarColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: const BorderSide(color: Color(0xFF333333), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: const BorderSide(color: Color(0xFF333333), width: 1),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, // Responsive padding
                vertical: 0
              ),
              constraints: BoxConstraints(maxHeight: screenHeight * 0.047),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.025), // Responsive spacing
        Container(
          height: screenHeight * 0.029, // Responsive height
          width: screenWidth * 0.0725, // Responsive width
          decoration: BoxDecoration(
            color: AppColors.appBarColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Color(0xFF333333), width: 1),
          ),
          child: Center(
            child: Text(
              "%",
              style: GoogleFonts.abel(
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor,
                fontSize: screenWidth * 0.03, // Responsive font size
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.025), // Responsive spacing
        Container(
          width: screenWidth * 0.11, // Responsive width
          height: screenHeight * 0.027, // Responsive height
          decoration: BoxDecoration(
            color: const Color(0xFFE4782A),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.all(screenWidth * 0.005), // Responsive margin
              width: screenWidth * 0.045, // Responsive width
              height: screenWidth * 0.045, // Responsive height (square)
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.025), // Responsive spacing
        Container(
          height: screenHeight * 0.029, // Responsive height
          width: screenWidth * 0.0725, // Responsive width
          decoration: BoxDecoration(
            color: AppColors.appBarColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Color(0xFF333333), width: 1),
          ),
          child: Center(
            child: Text(
              "₹",
              style: GoogleFonts.abel(
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor,
                fontSize: screenWidth * 0.03, // Responsive font size
              ),
            ),
          ),
        ),
      ],
    );
  }
}