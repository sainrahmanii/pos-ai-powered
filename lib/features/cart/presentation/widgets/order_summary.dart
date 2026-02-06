import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ai_powered/features/cart/models/cart_product.dart';
import 'package:pos_ai_powered/features/cart/presentation/pages/success_page.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';
import 'package:styled_divider/styled_divider.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.subTotal,
    required this.tax,
    required this.total,
    required this.cartProduct,
    required this.paymentMethod,
    required this.customer,
    required this.orderType,
  });

  final num subTotal;
  final num tax;
  final num total;
  final List<CartProduct> cartProduct;
  final String paymentMethod;
  final String customer;
  final String orderType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: 12,
        children: [
          Text(
            "Order Summary",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Column(
            spacing: 12,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Item total",
                    style: GoogleFonts.plusJakartaSans(color: Colors.grey),
                  ),
                  Text(
                    "Rp $subTotal",
                    style: GoogleFonts.plusJakartaSans(color: Colors.grey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tax    (10%)",
                    style: GoogleFonts.plusJakartaSans(color: Colors.grey),
                  ),
                  Text(
                    "Rp $tax",
                    style: GoogleFonts.plusJakartaSans(color: Colors.grey),
                  ),
                ],
              ),
              StyledDivider(
                color: Colors.grey[350],
                thickness: 2,
                lineStyle: DividerLineStyle.dashed,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Rp $total",
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SuccessPage(
                    paymentMethod: paymentMethod,
                    cartProduct: cartProduct,
                    subTotal: subTotal,
                    tax: tax,
                    total: total,
                    customer: customer,
                    orderType: orderType,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstant.primary,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 48),
              elevation: 0,
            ),
            child: Text("Proceed Transactions"),
          ),
        ],
      ),
    );
  }
}
