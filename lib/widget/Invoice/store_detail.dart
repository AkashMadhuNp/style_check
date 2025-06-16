import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class StoreDetails extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const StoreDetails({super.key, required this.screenWidth, required this.screenHeight});

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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getResponsiveWidth(context, 25), 
        right: getResponsiveWidth(context, 20)
      ),
      child: Row(
        children: [
          Container(
            height: screenHeight * 0.09,
            width: screenWidth * 0.41,
            decoration: BoxDecoration(
              color: AppColors.appBarColor,
              borderRadius: BorderRadius.circular(getResponsiveWidth(context, 8)),
              border: Border.all(color: Color(0xFF333333), width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.all(getResponsiveWidth(context, 8.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Date:04 Jun 2025",
                          style: GoogleFonts.abel(
                            color: AppColors.whiteColor,
                            fontSize: getResponsiveFontSize(context, 14),
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        Icons.calendar_month, 
                        size: getResponsiveWidth(context, 18), 
                        color: AppColors.hintTextColor
                      ),
                    ],
                  ),
                  SizedBox(height: getResponsiveHeight(context, 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Time:05.55 PM",
                          style: GoogleFonts.abel(
                            color: AppColors.whiteColor,
                            fontSize: getResponsiveFontSize(context, 14),
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        Icons.access_time, 
                        size: getResponsiveWidth(context, 18), 
                        color: Color(0xFF787878)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: getResponsiveWidth(context, 20)),
          Container(
            height: screenHeight * 0.09,
            width: screenWidth * 0.41,
            decoration: BoxDecoration(
              color: AppColors.appBarColor,
              borderRadius: BorderRadius.circular(getResponsiveWidth(context, 8)),
              border: Border.all(color: Color(0xFF333333), width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.all(getResponsiveWidth(context, 8.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Store Details",
                    style: GoogleFonts.abel(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: getResponsiveFontSize(context, 12),
                    ),
                  ),
                  SizedBox(height: getResponsiveHeight(context, 5)),
                  Text(
                    "Style Check",
                    style: GoogleFonts.abel(
                      color: AppColors.yellow,
                      fontWeight: FontWeight.w400,
                      fontSize: getResponsiveFontSize(context, 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "MainDown",
                          style: GoogleFonts.abel(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: getResponsiveFontSize(context, 12),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined, 
                        color: Colors.grey, 
                        size: getResponsiveWidth(context, 12)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}