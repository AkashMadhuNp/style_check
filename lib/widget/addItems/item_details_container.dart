import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';
import 'package:style__check/widget/Invoice/custom_text_field.dart';

class ItemDetailsContainer extends StatelessWidget {
  final double screenWidth;
  final Animation<double>? heightAnimation;
  final AnimationController? animationController;
  final Animation<double>? rotationAnimation;
  final bool isExpanded;
  final VoidCallback onToggleExpansion;

  const ItemDetailsContainer({
    super.key,
    required this.screenWidth,
    required this.heightAnimation,
    required this.animationController,
    required this.rotationAnimation,
    required this.isExpanded,
    required this.onToggleExpansion,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    
    return AnimatedBuilder(
      animation: animationController ?? AnimationController(duration: Duration.zero, vsync: Navigator.of(context)),
      builder: (context, child) {
        return Container(
          width: screenWidth * 0.898,
          height: heightAnimation?.value ?? (screenHeight * 0.6),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.020), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    label: "Item Name",
                    showAddButton: true,
                    addButtonText: "+ Add New Item",
                    onAddTap: () {},
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.26, // Responsive width
                        child: CustomTextField(label: "Quantity")
                      ),
                      SizedBox(width: screenWidth * 0.025),
                      SizedBox(
                        width: screenWidth * 0.26,
                        child: CustomTextField(label: "Free Quantity")
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      SizedBox(
                        width: screenWidth * 0.26,
                        child: CustomTextField(
                          label: "Units",
                          initialValue: "gm",
                          hasInitialValue: true,
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_right, 
                            size: screenWidth * 0.03, 
                            color: AppColors.whiteColor
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.4, // Responsive width
                        child: CustomTextField(label: "Rate (Price/Unit)")
                      ),
                      SizedBox(width: screenWidth * 0.025),
                      SizedBox(
                        width: screenWidth * 0.4,
                        child: CustomTextField(
                          label: "Tax",
                          hasInitialValue: true,
                          initialValue: "With Tax",
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_right, 
                            size: screenWidth * 0.03, 
                            color: AppColors.whiteColor
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.4,
                        child: CustomTextField(label: "Count")
                      ),
                      SizedBox(width: screenWidth * 0.025),
                      SizedBox(
                        width: screenWidth * 0.4,
                        child: CustomTextField(label: "MRP")
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.024),
                  Text(
                    "Description",
                    style: GoogleFonts.abel(
                      fontSize: screenWidth * 0.035, 
                      color: AppColors.hintTextColor
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  Container(
                    height: screenHeight * 0.11, // Responsive height
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF333333), width: 1),
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.appBarColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          hintText: "Description of Bill",
                          hintStyle: GoogleFonts.abel(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.03,
                            letterSpacing: (screenWidth * 0.03 * 4) / 100,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                        style: GoogleFonts.abel(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.03,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Additional Details",
                        style: GoogleFonts.abel(
                          fontSize: screenWidth * 0.03, 
                          color: AppColors.whiteColor
                        ),
                      ),
                      GestureDetector(
                        onTap: onToggleExpansion,
                        child: AnimatedBuilder(
                          animation: rotationAnimation ?? AlwaysStoppedAnimation(0.0),
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: (rotationAnimation?.value ?? 0.0) * 3.14159,
                              child: Icon(
                                Icons.keyboard_arrow_right, 
                                size: screenWidth * 0.03, 
                                color: AppColors.whiteColor
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  if (isExpanded) ...[
                    SizedBox(height: screenHeight * 0.018),
                    AnimatedOpacity(
                      opacity: isExpanded ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.4,
                                child: CustomTextField(
                                  label: "Colors",
                                  suffixIcon: Container(
                                    width: screenWidth * 0.04,
                                    height: screenWidth * 0.04,
                                    child: Image.asset(
                                      "assets/bx_color.png", 
                                      height: screenWidth * 0.03
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.025),
                              SizedBox(
                                width: screenWidth * 0.4, 
                                child: CustomTextField(label: "Size")
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}