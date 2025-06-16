import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';
import 'package:style__check/widget/Invoice/custom_check_box.dart';
import 'package:style__check/widget/Invoice/custom_text_field.dart';
import 'package:style__check/widget/dotted_text_field.dart' show DottedUnderlineTextField;

class DiscountAndCharges extends StatelessWidget {
  const DiscountAndCharges({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Calculate responsive values
    final responsiveHeight = screenHeight * 0.53; // ~430px on standard screen
    final responsivePadding = screenWidth * 0.021; // ~8px responsive
    final responsiveSpacing = screenHeight * 0.012; // ~10px responsive
    final responsiveBorderRadius = screenWidth * 0.027; // ~10px responsive
    
    return Container(
      height: responsiveHeight,
      width: screenWidth * 0.898,
      decoration: BoxDecoration(
        color: Color(0xFF0e0e0e),
        borderRadius: BorderRadius.circular(responsiveBorderRadius),
        border: Border.all(
          color: Colors.grey, 
          width: screenWidth * 0.0027 // ~1px responsive
        ),
      ),
    
      child: Padding(
        padding: EdgeInsets.all(responsivePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: responsiveSpacing),
            
            Text(
              "Discount & Charges",
              style: GoogleFonts.abel(
                fontSize: screenWidth * 0.043, // ~16px responsive
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor
              ),
            ),

            SizedBox(height: screenHeight * 0.025), // ~20px responsive
    
            // Discount Row - Made responsive with flexible layout
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "Discount",
                    style: GoogleFonts.abel(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.037, // ~14px responsive
                      color: AppColors.whiteColor
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(width: screenWidth * 0.027), // Responsive spacing

                // Text field - made responsive
                Container(
                  width: screenWidth * 0.32, // ~122px responsive
                  height: screenHeight * 0.048, // ~39px responsive
                  child: TextFormField(
                    style: GoogleFonts.abel(
                      fontSize: screenWidth * 0.033, // ~12.39px responsive
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      letterSpacing: 0.04 * screenWidth * 0.033,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      fillColor: AppColors.appBarColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.093), // ~35px responsive
                        borderSide: BorderSide(
                          color: Color(0xFF333333), 
                          width: screenWidth * 0.0027 // ~1px responsive
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.093),
                        borderSide: BorderSide(
                          color: Color(0xFF333333), 
                          width: screenWidth * 0.0027
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.093),
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.093),
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.093),
                        borderSide: BorderSide(
                          color: Color(0xFF333333), 
                          width: screenWidth * 0.0027
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.043, // ~16px responsive
                        vertical: 0
                      ),
                      constraints: BoxConstraints(maxHeight: screenHeight * 0.048),
                    ),
                  ),
                ),

                SizedBox(width: screenWidth * 0.027), // ~10px responsive

                // Percentage container
                Container(
                  height: screenHeight * 0.03, // ~24px responsive
                  width: screenWidth * 0.077, // ~29px responsive
                  decoration: BoxDecoration(
                    color: AppColors.appBarColor,
                    borderRadius: BorderRadius.circular(screenWidth * 0.013), // ~5px responsive
                    border: Border.all(
                      color: Color(0xFF333333), 
                      width: screenWidth * 0.0027 // ~1px responsive
                    )
                  ),
                  child: Center(
                    child: Text(
                      "%",
                      style: GoogleFonts.abel(
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor,
                        fontSize: screenWidth * 0.032 // ~12px responsive
                      ),
                    ),
                  ),
                ),

                SizedBox(width: screenWidth * 0.027), // ~10px responsive

                // Toggle switch
                Container(
                  width: screenWidth * 0.117, // ~44px responsive
                  height: screenHeight * 0.027, // ~22px responsive
                  decoration: BoxDecoration(
                    color: Color(0xFFE4782A),
                    borderRadius: BorderRadius.circular(screenWidth * 0.029), // ~11px responsive
                  ),
                  child: Align(
                    alignment: Alignment.centerRight, 
                    child: Container(
                      margin: EdgeInsets.all(screenWidth * 0.005), // ~2px responsive
                      width: screenWidth * 0.048, // ~18px responsive
                      height: screenWidth * 0.048, // ~18px responsive
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: screenWidth * 0.027), // ~10px responsive

                // Currency container
                Container(
                  height: screenHeight * 0.03, // ~24px responsive
                  width: screenWidth * 0.077, // ~29px responsive
                  decoration: BoxDecoration(
                    color: AppColors.appBarColor,
                    borderRadius: BorderRadius.circular(screenWidth * 0.013), // ~5px responsive
                    border: Border.all(
                      color: Color(0xFF333333), 
                      width: screenWidth * 0.0027 // ~1px responsive
                    )
                  ),
                  child: Center(
                    child: Text(
                      "₹",
                      style: GoogleFonts.abel(
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor,
                        fontSize: screenWidth * 0.032 // ~12px responsive
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.018), // ~15px responsive

            CustomTextField(
              label: "Shipping",
              hasInitialValue: true,
              initialValue: "100",
            ),
            
            SizedBox(height: screenHeight * 0.018), // ~15px responsive
            
            CustomTextField(
              label: "Packaging",
              hasInitialValue: true,
              initialValue: "100",
            ),
            
            SizedBox(height: screenHeight * 0.018), // ~15px responsive
            
            CustomTextField(
              label: "Adjustment",
              hasInitialValue: true,
              initialValue: "100",
            ),
            
            SizedBox(height: screenHeight * 0.025), // ~20px responsive

            // Round Off Row
            Row(
              children: [
                CustomCheckbox(
                  borderColor: AppColors.whiteColor,
                  iconColor: AppColors.whiteColor,
                  initialValue: false,
                  onChanged: (value) {
                    print('Checkbox changed to: $value');
                  },
                ),
                
                SizedBox(width: responsiveSpacing),
                
                Flexible(
                  flex: 2,
                  child: Text(
                    "Round Off",
                    style: GoogleFonts.abel(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.032 // ~12px responsive
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                
                SizedBox(width: screenWidth * 0.027), // Spacing
                
                // Currency and text field row
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
                      child: DottedUnderlineTextField()
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}