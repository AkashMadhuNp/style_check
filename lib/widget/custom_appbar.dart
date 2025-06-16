import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showCartIcon;
  final VoidCallback? onBackPressed;
  final VoidCallback? onCartPressed;
  final String? cartIconPath;
  final List<Widget>? customActions;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? iconColor;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showCartIcon = true,
    this.onBackPressed,
    this.onCartPressed,
    this.cartIconPath = "assets/cart.svg",
    this.customActions,
    this.backgroundColor,
    this.titleColor = Colors.white,
    this.iconColor = Colors.white,
    this.titleFontSize = 18,
    this.titleFontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.appBarColor,
      title: Text(
        title,
        style: GoogleFonts.gudea(
          color: titleColor,
          fontSize: titleFontSize,
          fontWeight: titleFontWeight,
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios, color: iconColor),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                foregroundColor: iconColor,
                overlayColor: Colors.transparent, // Removes ripple effect
              ),
            )
          : null,
      actions: _buildActions(),
      iconTheme: IconThemeData(color: iconColor),
    );
  }

  List<Widget>? _buildActions() {
    List<Widget> actions = [];

    if (customActions != null) {
      actions.addAll(customActions!);
    }

    if (showCartIcon && cartIconPath != null) {
      actions.add(
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: GestureDetector(
            onTap: onCartPressed,
            child: SvgPicture.asset(
              cartIconPath!,
              height: 24,
              width: 24,
            ),
          ),
        ),
      );
    }

    return actions.isEmpty ? null : actions;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}