import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final double width;
  final String? hint;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    this.value,
    required this.items,
    required this.width,
    this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.abel(fontSize: 14, color: AppColors.hintTextColor),
        ),
        SizedBox(height: 8),
        Container(
          width: width,
          height: 39,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: AppColors.appBarColor,
            border: Border.all(color: Color(0xFF333333), width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: hint != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        hint!,
                        style: GoogleFonts.abel(
                          color: AppColors.hintTextColor,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : null,
              icon: Icon(Icons.arrow_right_sharp, color: Colors.white, size: 20),
              iconSize: 20,
              elevation: 16,
              style: GoogleFonts.abel(color: Colors.white, fontSize: 14),
              dropdownColor: AppColors.appBarColor,
              borderRadius: BorderRadius.circular(8),
              items: items.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      item,
                      style: GoogleFonts.abel(color: Colors.white, fontSize: 14),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}