import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class BillDescriptionMeida extends StatelessWidget {
  const BillDescriptionMeida({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width:screenWidth * 0.898 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.hintTextColor,
          width: 1
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bill Description & Media",
              style: GoogleFonts.abel(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor
              ),
              ),
    
              SizedBox(height: 20,),
    
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text("Description",
                style: GoogleFonts.abel(
                  color: AppColors.hintTextColor
                ),
                ),
              ),
    
              SizedBox(height: 10,),
    
              Center(
                    child: Container(
                      height: 78,
                      width: 301,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF333333),
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.appBarColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0), 
                        child: TextField(
                          maxLines: null,                           expands: true, 
                          textAlignVertical: TextAlignVertical.top, 
                          decoration: InputDecoration(
                            hintText: "Description of Bill",
                            hintStyle: GoogleFonts.abel(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              letterSpacing: (12*4)/100
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero, 
                            isDense: true, 
                          ),
                          style: GoogleFonts.abel(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
    
              SizedBox(height: 15,),
    
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Container(
                  height: 28,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.appBarColor,
                    border: Border.all(
                      color: AppColors.border,
                      width: 1
                    )
                  ),
    
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_file,color: Colors.white,size: 12,),
                      Text("Add Media",
                      style: GoogleFonts.abel(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              letterSpacing: (12*4)/100
                            ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}