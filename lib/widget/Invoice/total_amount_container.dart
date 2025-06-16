import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';
import 'package:style__check/widget/Invoice/custom_check_box.dart';
import 'package:style__check/widget/Invoice/extra_text.dart';
import 'package:style__check/widget/dotted_text_field.dart';

class TotalAmountContainer extends StatelessWidget {
  const TotalAmountContainer({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Calculate responsive values
    final responsiveHeight = screenHeight * 0.32; // ~260px on standard screen
    final responsivePadding = screenWidth * 0.021; // ~8px responsive
    final responsiveSpacing = screenHeight * 0.012; // ~10px responsive
    final responsiveBorderRadius = screenWidth * 0.027; // ~10px responsive
    
    return Container(
      height: responsiveHeight,
      width: screenWidth * 0.898,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(responsiveBorderRadius),
        color: AppColors.whiteColor
      ),
    
      child: Padding(
        padding: EdgeInsets.all(responsivePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: responsiveSpacing),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "Total Amount",
                    style: GoogleFonts.abel(
                      fontSize: screenWidth * 0.043, // ~16px responsive
                      fontWeight: FontWeight.w400,
                      color: AppColors.bgblack
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(width: screenWidth * 0.027), // Spacing

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "₹",
                      style: GoogleFonts.abel(
                        color: AppColors.yellow,
                        fontSize: screenWidth * 0.037, // ~14px responsive
                        height: 1.0,
                      ),
                    ),
                    
                    SizedBox(width: screenWidth * 0.013), // ~5px responsive
                    
                    Container(
                      width: screenWidth * 0.16, // ~60px responsive
                      height: screenHeight * 0.025, // ~20px responsive
                      child: DottedUnderlineTextField(
                        textColor: Colors.black,
                        dottedLineColor: AppColors.bgblack,
                      )
                    ),
                  ],
                )
              ],
            ),

            SizedBox(height: responsiveSpacing),

            Row(
              children: [
                CustomCheckbox(
                  borderColor: AppColors.bgblack, 
                  iconColor: AppColors.bgblack,
                ),

                SizedBox(width: responsiveSpacing),

                Flexible(
                  flex: 2,
                  child: Text(
                    "Loyalty Points",
                    style: GoogleFonts.abel(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.032 // ~12px responsive
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(width: screenWidth * 0.027), // Spacing

                Text(
                  "Redeemable: 700Pts",
                  style: GoogleFonts.abel(
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.032 // ~12px responsive
                  ),
                ),
              ],
            ),

            SizedBox(height: responsiveSpacing),

            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: screenHeight * 0.05, // ~42px responsive
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.bgblack,
                        width: screenWidth * 0.0027 // ~1px responsive
                      ),
                      borderRadius: BorderRadius.circular(responsiveBorderRadius)
                    ),
                  ),
                ),

                SizedBox(width: screenWidth * 0.027), // Spacing

                Text(
                  "Value: ₹200",
                  style: GoogleFonts.abel(
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.032, // ~12px responsive
                    color: AppColors.yellow
                  ),
                ),
              ],
            ),

            SizedBox(height: responsiveSpacing),

            ExtTxt(textone: "Remaining Amount", texttwo: "734.98"),

            SizedBox(height: responsiveSpacing),

            Row(
              children: [
                CustomCheckbox(
                  borderColor: AppColors.bgblack, 
                  iconColor: AppColors.bgblack,
                ),

                SizedBox(width: responsiveSpacing),

                Flexible(
                  child: Text(
                    "Recieved",
                    style: GoogleFonts.abel(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.032 // ~12px responsive
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(width: responsiveSpacing),

                Container(
                  width: screenWidth * 0.16, // ~60px responsive
                  height: screenHeight * 0.031, // ~25px responsive
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.043), // ~16px responsive
                    color: AppColors.bgblack
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.link,
                        color: AppColors.whiteColor,
                        size: screenWidth * 0.043, // ~16px responsive
                      ),
                      Text(
                        "Link",
                        style: GoogleFonts.abel(
                          color: AppColors.whiteColor,
                          fontSize: screenWidth * 0.024 // ~9px responsive
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(width: screenWidth * 0.027), // Spacing

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "₹",
                      style: GoogleFonts.abel(
                        color: AppColors.bgblack,
                        fontSize: screenWidth * 0.037, // ~14px responsive
                        height: 1.0,
                      ),
                    ),
                    
                    SizedBox(width: screenWidth * 0.013), // ~5px responsive
                    
                    Container(
                      width: screenWidth * 0.16, // ~60px responsive
                      height: screenHeight * 0.025, // ~20px responsive
                      child: DottedUnderlineTextField(
                        textColor: Colors.black,
                        dottedLineColor: AppColors.bgblack,
                      )
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: responsiveSpacing),

            ExtTxt(textone: "Balance Due", texttwo: "734.98"),

            SizedBox(height: responsiveSpacing),
            
            ExtTxt(textone: "Points Awarded", texttwo: "0.00")
          ],
        ),
      ),
    );
  }
}