import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class PaymentTypeWidget extends StatelessWidget {
  const PaymentTypeWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Payment Type",
                style: GoogleFonts.abel(
                  color: AppColors.whiteColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w200
                ),
                ),
          
                Spacer(),
          
                Icon(Icons.credit_card_rounded,color: AppColors.whiteColor,size: 12,),
          
                SizedBox(width: 10,),
          
                 Text(
                "Cash",
                style: GoogleFonts.abel(
                  color: AppColors.whiteColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w200
                ),
                ),
          
                SizedBox(width: 10,),
          
                Icon(Icons.keyboard_arrow_right,color: AppColors.whiteColor,size: 12,),
          
          
          
            ],
          ),
    
    
          SizedBox(height: 10,),
    
          Container(
            height: 27,
            width:screenWidth * 0.898 ,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20)
    
            ),
            child: Center(
              child: Text("+ Add Payment Type",
              style: GoogleFonts.abel(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.bgblack
              ),
              ),
            ),
          ),
    
          SizedBox(height: 10,),
    
    
           Row(
            children: [
              Text(
                "No. of copies",
                style: GoogleFonts.abel(
                  color: AppColors.hintTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w200
                ),
                ),
          
                Spacer(),
          
                
          
                 Text(
                "None",
                style: GoogleFonts.abel(
                  color: AppColors.hintTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w200
                ),
                ),
          
                SizedBox(width: 10,),
          
                Icon(Icons.keyboard_arrow_right,color: AppColors.hintTextColor,size: 12,),
          
          
          
            ],
          ),
    
    
    
          SizedBox(height: 10,),
    
    
           Row(
            children: [
              Text(
                "State of Supply",
                style: GoogleFonts.abel(
                  color: AppColors.hintTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w200
                ),
                ),
          
                Spacer(),
          
                
          
                 Text(
                "Select State",
                style: GoogleFonts.abel(
                  color: AppColors.hintTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w200
                ),
                ),
          
                SizedBox(width: 10,),
          
                Icon(Icons.keyboard_arrow_right,color: AppColors.hintTextColor,size: 12,),
          
          
          
            ],
          ),
        ],
      ),
    );
  }
}
