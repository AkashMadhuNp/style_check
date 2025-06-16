import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';
import 'package:style__check/widget/Invoice/custom_check_box.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Shipping Address",
                style: GoogleFonts.abel(fontSize: 14, color: AppColors.whiteColor),
              ),
          
              Spacer(),
          
              CustomCheckbox(borderColor: Colors.white, iconColor: Colors.white),
              SizedBox(width: 10,),
              Text(
                "Same as Billing Address",
                style: GoogleFonts.abel(fontSize: 14, color: AppColors.whiteColor),
              ),
            ],
          ),
    
          SizedBox(height: 10,),
    
    
          TextFormField(
              
              style: GoogleFonts.abel(
    fontSize: 12.39,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0.04 * 12.39,
    color: Colors.white,
              ),
              decoration: InputDecoration(
    hintText: "Shipping Address",
    hintStyle:GoogleFonts.abel(
    fontSize: 12.39,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0.04 * 12.39,
    color: Colors.white,
              ) ,
    fillColor: AppColors.appBarColor,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Color(0xFF333333), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Color(0xFF333333), width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Colors.red, width: 2.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Color(0xFF333333), width: 1),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    constraints: BoxConstraints(maxHeight: 39),
              ),
            ),
        ],
      ),
    );
  }
}

