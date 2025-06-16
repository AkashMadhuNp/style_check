import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class ExtTxt extends StatelessWidget {
  final String textone;  // Changed from Text to String
  final String? texttwo;
  final Color? color;
  final double? fontSize;
  
  const ExtTxt({
    super.key, 
    required this.textone,
    required this.texttwo, 
    this.color, this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textone,
          style: GoogleFonts.abel(
            fontSize:fontSize ?? 12,
            fontWeight: FontWeight.w400,
            color:color ?? AppColors.hintTextColor 
          ),
        ),
        Text(
          texttwo ?? '', 
          style: GoogleFonts.abel(
            fontSize:fontSize ?? 12,
            fontWeight: FontWeight.w400,
            color:color ?? AppColors.hintTextColor 
          ),
        ),
      ],
    );
  }
}