import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class InvoiceNo extends StatelessWidget {
  const InvoiceNo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/bg.png", 
          height: 100, 
          width: double.infinity
          ),
        Positioned(
          top: 20,
          left: 50,
          right: 35,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Invoice No",
                    style: GoogleFonts.abel(
                      color: AppColors.hintTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(Icons.settings, color: AppColors.whiteColor),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset("assets/basil_invoice-outline.svg", height: 18),
                  SizedBox(width: 10),
                  Text(
                    "INV-2025-001",
                    style: GoogleFonts.abel(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
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