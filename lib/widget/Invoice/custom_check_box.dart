import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final Color? borderColor;
  final Color? iconColor;
  final ValueChanged<bool>? onChanged;

  const CustomCheckbox({
    Key? key,
    this.initialValue = false,
    this.onChanged, 
    required this.borderColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(isChecked);
        }
      },
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: widget.borderColor ?? Colors.grey, // Fixed: Added widget. prefix and null fallback
            width: 1,
          ),
          color: Colors.transparent,
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                size: 8,
                color: widget.iconColor ?? Colors.black, // Fixed: Added widget. prefix and null fallback
              )
            : null,
      ),
    );
  }
}