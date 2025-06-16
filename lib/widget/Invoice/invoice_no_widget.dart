import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class InvoiceNo extends StatelessWidget {
  const InvoiceNo({super.key});

  // Helper methods for responsive design (matching your main AddInvoice file)
  double getResponsiveHeight(BuildContext context, double baseHeight) {
    final screenHeight = MediaQuery.of(context).size.height;
    const double baseScreenHeight = 915.0;
    double scaleFactor = (screenHeight / baseScreenHeight);
    scaleFactor = scaleFactor.clamp(0.7, 1.3);
    return baseHeight * scaleFactor;
  }

  double getResponsiveWidth(BuildContext context, double baseWidth) {
    final screenWidth = MediaQuery.of(context).size.width;
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
    return Stack(
      children: [
        Image.asset(
          "assets/bg.png", 
          height: getResponsiveHeight(context, 100), 
          width: double.infinity,
        ),
        Positioned(
          top: getResponsiveHeight(context, 20),
          left: getResponsiveWidth(context, 20),
          right: getResponsiveWidth(context, 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Invoice No",
                    style: GoogleFonts.abel(
                      color: AppColors.hintTextColor,
                      fontSize: getResponsiveFontSize(context, 12),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.settings, 
                    color: AppColors.whiteColor,
                    size: getResponsiveWidth(context, 24),
                  ),
                ],
              ),
              SizedBox(height: getResponsiveHeight(context, 8)),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/basil_invoice-outline.svg", 
                    height: getResponsiveHeight(context, 18),
                  ),
                  SizedBox(width: getResponsiveWidth(context, 10)),
                  Text(
                    "INV-2025-001",
                    style: GoogleFonts.abel(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: getResponsiveFontSize(context, 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}