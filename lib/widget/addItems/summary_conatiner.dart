import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';
import 'package:style__check/widget/Invoice/extra_text.dart';
import 'package:style__check/widget/addItems/discount_input_row.dart';
import 'package:style__check/widget/addItems/tax_input_row.dart';

class SummaryContainer extends StatelessWidget {
  final double screenWidth;

  const SummaryContainer({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    
    return Container(
      height: screenHeight * 0.238, // Responsive height (23.8% of screen height)
      width: screenWidth * 0.898,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.012), // Responsive spacing
            ExtTxt(
              textone: "Subtotal (Rate x Qty)",
              texttwo: "₹200.00",
              color: AppColors.whiteColor,
              fontSize: screenWidth * 0.035, // Responsive font size
            ),
            SizedBox(height: screenHeight * 0.012), // Responsive spacing
            const DiscountInputRow(),
            SizedBox(height: screenHeight * 0.012), // Responsive spacing
            const TaxInputRow(),
            SizedBox(height: screenHeight * 0.012), // Responsive spacing
            ExtTxt(
              textone: "Total Amount",
              texttwo: "₹200.00",
              fontSize: screenWidth * 0.04, // Responsive font size (slightly larger)
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}