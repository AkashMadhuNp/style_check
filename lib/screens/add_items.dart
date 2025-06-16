import 'package:flutter/material.dart';
import 'package:style__check/widget/addItems/action_button.dart';
import 'package:style__check/widget/addItems/item_details_container.dart';
import 'package:style__check/widget/addItems/summary_conatiner.dart';
import 'package:style__check/widget/custom_appbar.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> with TickerProviderStateMixin {
  bool isExpanded = false;
  AnimationController? _animationController;
  Animation<double>? _heightAnimation;
  Animation<double>? _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Initialize animations with responsive values after context is available
    final double screenHeight = MediaQuery.of(context).size.height;
    
    _heightAnimation = Tween<double>(
      begin: screenHeight * 0.6,  // Responsive collapsed height
      end: screenHeight * 0.74,   // Responsive expanded height
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    if (_animationController != null) {
      setState(() {
        isExpanded = !isExpanded;
        if (isExpanded) {
          _animationController!.forward();
        } else {
          _animationController!.reverse();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(title: "Add Items"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.0625,    // Responsive padding
            right: screenWidth * 0.0625, 
            top: screenHeight * 0.012
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.012),
              ItemDetailsContainer(
                screenWidth: screenWidth,
                heightAnimation: _heightAnimation,
                animationController: _animationController,
                rotationAnimation: _rotationAnimation,
                isExpanded: isExpanded,
                onToggleExpansion: _toggleExpansion,
              ),
              SizedBox(height: screenHeight * 0.024),
              SummaryContainer(screenWidth: screenWidth),
              SizedBox(height: screenHeight * 0.024),
              const ActionButtons(),
              SizedBox(height: screenHeight * 0.048),
            ],
          ),
        ),
      ),
    );
  }
}