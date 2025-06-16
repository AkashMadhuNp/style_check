import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class TaxInputRow extends StatelessWidget {
  const TaxInputRow({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Tax %",
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w400,
            fontSize: screenWidth * 0.035, // Responsive font size
            color: AppColors.whiteColor,
          ),
        ),
        Container(
          width: screenWidth * 0.5625, // Responsive width (56.25% of screen width)
          child: TextFormField(
            style: GoogleFonts.abel(
              fontSize: screenWidth * 0.03, // Responsive font size
              fontWeight: FontWeight.w400,
              height: 1.0,
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
              constraints: BoxConstraints(maxHeight: screenHeight * 0.047), // Responsive height
              suffixIcon: Icon(
                Icons.keyboard_arrow_right_sharp,
                size: screenWidth * 0.03, // Responsive icon size
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}