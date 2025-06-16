import 'package:flutter/material.dart';

class DottedUnderlineTextField extends StatelessWidget {
  final Color textColor;
  final Color dottedLineColor;

  const DottedUnderlineTextField({
    super.key,
    this.textColor = Colors.white,
    this.dottedLineColor = Colors.white,
  });

  // Helper method to get responsive dimensions
  double getResponsiveHeight(BuildContext context, double baseHeight) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Base reference: Pixel 7 Pro (approximately 915 logical pixels height)
    const double baseScreenHeight = 915.0;
    
    // Calculate scale factor
    double scaleFactor = (screenHeight / baseScreenHeight);
    
    // Clamp the scale factor to prevent extreme scaling
    scaleFactor = scaleFactor.clamp(0.7, 1.3);
    
    return baseHeight * scaleFactor;
  }

  double getResponsiveWidth(BuildContext context, double baseWidth) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Base reference: Pixel 7 Pro (approximately 412 logical pixels width)
    const double baseScreenWidth = 412.0;
    
    double scaleFactor = (screenWidth / baseScreenWidth);
    scaleFactor = scaleFactor.clamp(0.7, 1.3);
    
    return baseWidth * scaleFactor;
  }

  double getResponsiveFontSize(BuildContext context, double baseFontSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double baseScreenWidth = 412.0;
    
    double scaleFactor = (screenWidth / baseScreenWidth);
    scaleFactor = scaleFactor.clamp(0.8, 1.2);
    
    return baseFontSize * scaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.transparent, 
          ),
        ),
      ),
      child: Stack(
        children: [
          TextField(
            style: TextStyle(
              color: textColor,
              fontSize: getResponsiveFontSize(context, 14),
              height: 1.0,
            ),
            cursorColor: textColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '',
              hintStyle: TextStyle(color: Colors.white54),
              contentPadding: EdgeInsets.only(bottom: getResponsiveHeight(context, 2)),
              isDense: true,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: DottedLinePainter(
                color: dottedLineColor,
                context: context,
              ),
              size: Size.fromHeight(getResponsiveHeight(context, 1)),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;
  final BuildContext context;

  DottedLinePainter({this.color = Colors.white, required this.context});

  double getResponsiveWidth(double baseWidth) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double baseScreenWidth = 412.0;
    
    double scaleFactor = (screenWidth / baseScreenWidth);
    scaleFactor = scaleFactor.clamp(0.7, 1.3);
    
    return baseWidth * scaleFactor;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    final double dashWidth = getResponsiveWidth(2);
    final double dashSpace = getResponsiveWidth(2);
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}