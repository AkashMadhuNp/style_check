import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style__check/constant/colors.dart';
import 'package:style__check/widget/Invoice/billdescription_media.dart';
import 'package:style__check/widget/Invoice/custom_button.dart';
import 'package:style__check/widget/Invoice/custom_drop_down.dart';
import 'package:style__check/widget/Invoice/custom_text_field.dart';
import 'package:style__check/widget/Invoice/discount_charges_widget.dart';
import 'package:style__check/widget/Invoice/extra_text.dart';
import 'package:style__check/widget/Invoice/invoice_no_widget.dart';
import 'package:style__check/widget/Invoice/payment_type_widget.dart';
import 'package:style__check/widget/Invoice/save_buttons.dart';
import 'package:style__check/widget/Invoice/shipping_address_widget.dart';
import 'package:style__check/widget/Invoice/store_detail.dart';
import 'package:style__check/widget/Invoice/total_amount_container.dart';
import 'package:style__check/widget/Invoice/woolen_sweater_widget.dart';
import 'package:style__check/widget/custom_appbar.dart';
import 'package:style__check/widget/date_picker.dart';

class AddInvoice extends StatefulWidget {
  const AddInvoice({super.key});

  @override
  State<AddInvoice> createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  String? selectedPaymentTerm = 'Net 15';
  String? selectedEwayBill;
  double baseContainerHeight = 421; // Base container height for reference
  bool showProductWidgets = false; 
  bool isChecked = false;

  final List<String> paymentTerms = [
    'Net 15',
    'Net 30',
    'Net 45',
    'Net 60',
    'Due on Receipt',
    'Cash on Delivery'
  ];

  final List<String> ewayBillOptions = [
    'E-Way Bill Required',
    'E-Way Bill Not Required',
    'Pending E-Way Bill',
    'Completed E-Way Bill'
  ];

  @override
  void initState() {
    super.initState();
  }

  // Helper method to get responsive dimensions
  double getResponsiveHeight(BuildContext context, double baseHeight) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenDensity = MediaQuery.of(context).devicePixelRatio;
    
    // Base reference: Pixel 7 Pro (approximately 915 logical pixels height)
    const double baseScreenHeight = 915.0;
    
    // Calculate scale factor with density consideration
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

  void toggleProductSection() {
    setState(() {
      showProductWidgets = !showProductWidgets;
    });
  }

  Widget _buildAnimatedWidget({
    required Widget child,
    required bool show,
    Duration duration = const Duration(milliseconds: 400),
  }) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.3),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: show
          ? child
          : SizedBox.shrink(key: ValueKey('hidden-${child.hashCode}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    // Calculate responsive dimensions
    double containerHeight = showProductWidgets 
        ? getResponsiveHeight(context, 630) 
        : getResponsiveHeight(context, 421);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(title: "Add Invoice"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0,left: 20),
              child: InvoiceNo(),
            ),
            SizedBox(height: getResponsiveHeight(context, 10)),
            StoreDetails(screenWidth: screenWidth, screenHeight: screenHeight),
            SizedBox(height: getResponsiveHeight(context, 20)),

            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              margin: EdgeInsets.only(
                top: getResponsiveHeight(context, 5), 
                left: getResponsiveWidth(context, 10), 
                right: getResponsiveWidth(context, 5)
              ),
              width: screenWidth * 0.898,
              height: containerHeight,
              decoration: BoxDecoration(
                color: Color(0xFF0e0e0e),
                borderRadius: BorderRadius.circular(getResponsiveWidth(context, 10)),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(getResponsiveWidth(context, 10)),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(getResponsiveWidth(context, 16.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomDropdown(
                              label: "Pmt Terms",
                              value: selectedPaymentTerm,
                              items: paymentTerms,
                              width: screenWidth * 0.388,
                              onChanged: (value) {
                                setState(() => selectedPaymentTerm = value);
                              },
                            ),
                            SizedBox(width: getResponsiveWidth(context, 15)),
                            DatePickerWidget(),
                          ],
                        ),
                        SizedBox(height: getResponsiveHeight(context, 20)),
                        CustomTextField(
                          label: "Customer Name",
                          showAddButton: true,
                          addButtonText: "+ Add New Customer",
                          onAddTap: () {},
                        ),
                        SizedBox(height: getResponsiveHeight(context, 20)),
                        CustomTextField(label: "Phone Number"),
                        SizedBox(height: getResponsiveHeight(context, 20)),
                        CustomDropdown(
                          label: "E-Way Bill No",
                          value: selectedEwayBill,
                          items: ewayBillOptions,
                          width: double.infinity,
                          hint: "E-Way Bill No",
                          onChanged: (value) {
                            setState(() => selectedEwayBill = value);
                          },
                        ),
                        SizedBox(height: getResponsiveHeight(context, 20)),

                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SizeTransition(
                                sizeFactor: animation,
                                child: child,
                              ),
                            );
                          },
                          child: showProductWidgets
                              ? Column(
                                  key: ValueKey('product-widgets'),
                                  children: [
                                    WoolenSweaterWidget(),
                                    SizedBox(height: getResponsiveHeight(context, 20)),
                                    ExtTxt(textone: "Total Disc: 0.0", texttwo: "Total Tax Amt: 0.0"),
                                    ExtTxt(textone: "Total Qty: 1", texttwo: "Subtotal: ₹1000.00 "),
                                    SizedBox(height: getResponsiveHeight(context, 20)),
                                  ],
                                )
                              : SizedBox.shrink(key: ValueKey('empty')),
                        ),

                        Row(
                          children: [
                            GestureDetector(
                              onTap: toggleProductSection,
                              child: CustomButton(
                                text: showProductWidgets ? "- Remove Product" : "+ Add Product",
                                width: screenWidth * 0.7,
                                height: getResponsiveHeight(context, 33),
                                color: Colors.white,
                                textStyle: GoogleFonts.abel(
                                  fontWeight: FontWeight.w400,
                                  fontSize: getResponsiveFontSize(context, 12),
                                  letterSpacing: 0.48,
                                ),
                              ),
                            ),
                            SizedBox(width: getResponsiveWidth(context, 10)),
                            SvgPicture.asset(
                              "assets/qr.svg", 
                              height: getResponsiveHeight(context, 34), 
                              width: getResponsiveWidth(context, 34)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: getResponsiveHeight(context, 20)),

            _buildAnimatedWidget(
              show: showProductWidgets,
              child: Column(
                key: ValueKey('animated-widgets'),
                children: [
                  DiscountAndCharges(screenWidth: screenWidth),
                  SizedBox(height: getResponsiveHeight(context, 20)),
                  TotalAmountContainer(screenWidth: screenWidth),
                  SizedBox(height: getResponsiveHeight(context, 20)),
                  PaymentTypeWidget(screenWidth: screenWidth),
                  SizedBox(height: getResponsiveHeight(context, 20)),
                  BillDescriptionMeida(screenWidth: screenWidth),
                  SizedBox(height: getResponsiveHeight(context, 20)),
                  Padding(
                    padding: EdgeInsets.only(
                      right: getResponsiveWidth(context, 25), 
                      left: getResponsiveWidth(context, 25)
                    ),
                    child: CustomTextField(
                      label: "Billing Address:",
                      hasInitialValue: true,
                      initialValue: "Billing Address",
                      labelColor: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: getResponsiveHeight(context, 20)),
                  ShippingAddressWidget(),
                  SizedBox(height: getResponsiveHeight(context, 34)),
                ],
              ),
            ),

            SaveButtons(screenWidth: screenWidth),
            SizedBox(height: getResponsiveHeight(context, 50)),
          ],
        ),
      ),
    );
  }
}