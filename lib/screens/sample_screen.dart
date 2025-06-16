import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';
import 'package:style__check/screens/add_invoice.dart';
import 'package:style__check/screens/add_items.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hintTextColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddInvoice(),));
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.bgblack
                  ),
                  child: Center(
                    child: Text("Add Invoice Page",style: GoogleFonts.abel(
                      color: AppColors.whiteColor
                    ),),
                  ),
                ),
              ),
            ),
          ),



          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddItems(),));
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.bgblack
                  ),
                  child: Center(
                    child: Text("Add Items Page",style: GoogleFonts.abel(
                      color: AppColors.whiteColor
                    ),),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}