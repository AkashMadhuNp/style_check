import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class WoolenSweaterWidget extends StatelessWidget {
  const WoolenSweaterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Calculate responsive values
    final responsiveHeight = screenHeight * 0.135; // ~109px on standard screen
    final responsivePadding = screenWidth * 0.032; // ~12px on standard screen
    final responsiveVerticalPadding = screenHeight * 0.01; // ~8px on standard screen
    
    return Container(
      height: responsiveHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF333333), 
          width: screenWidth * 0.0027 // ~1px responsive border
        ),
        borderRadius: BorderRadius.circular(screenWidth * 0.021) // ~8px responsive
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: responsiveVerticalPadding,
          right: responsivePadding,
          left: responsivePadding,
          bottom: responsiveVerticalPadding
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: Text(
                    "WOOLEN SWEATER - COKE",
                    style: GoogleFonts.abel(
                      fontSize: screenWidth * 0.037, // ~14px responsive
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: screenWidth * 0.021), // ~8px spacing
                Text(
                  "₹200.00",
                  style: GoogleFonts.abel(
                    fontSize: screenWidth * 0.037, // ~14px responsive
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "Items Subtotal",
                    style: GoogleFonts.abel(
                      fontSize: screenWidth * 0.032, // ~12px responsive
                      fontWeight: FontWeight.w400,
                      color: AppColors.hintTextColor
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: screenWidth * 0.021), // ~8px spacing
                Text(
                  "1 x 200 = ₹200.00",
                  style: GoogleFonts.abel(
                    fontSize: screenWidth * 0.032, // ~12px responsive
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintTextColor
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "Discount(%): 0",
                    style: GoogleFonts.abel(
                      fontSize: screenWidth * 0.037, // ~14px responsive
                      fontWeight: FontWeight.w400,
                      color: AppColors.yellow
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: screenWidth * 0.021), // ~8px spacing
                Text(
                  "₹0.00",
                  style: GoogleFonts.abel(
                    fontSize: screenWidth * 0.037, // ~14px responsive
                    fontWeight: FontWeight.w400,
                    color: AppColors.yellow
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "Tax: 0%",
                    style: GoogleFonts.abel(
                      fontSize: screenWidth * 0.032, // ~12px responsive
                      fontWeight: FontWeight.w400,
                      color: AppColors.hintTextColor
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: screenWidth * 0.021), // ~8px spacing
                Text(
                  "₹0.00",
                  style: GoogleFonts.abel(
                    fontSize: screenWidth * 0.032, // ~12px responsive
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintTextColor
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}