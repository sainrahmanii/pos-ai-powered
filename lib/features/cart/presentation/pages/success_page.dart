import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ai_powered/features/cart/presentation/widgets/item_transaction_details.dart';
import 'package:pos_ai_powered/main_screen.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';
import 'package:styled_divider/styled_divider.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf8fafc),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 60,
                    left: 16,
                    right: 16,
                    bottom: 20,
                  ),
                  margin: EdgeInsets.only(top: 60),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    spacing: 10,
                    children: [
                      Text(
                        "Kopi Tuku",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Transaction details",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment Method",
                            style: GoogleFonts.plusJakartaSans(),
                          ),
                          Text(
                            "QRIS",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Status", style: GoogleFonts.plusJakartaSans()),
                          Text(
                            "Success",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date", style: GoogleFonts.plusJakartaSans()),
                          Text(
                            "5 Februari 2026",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Time", style: GoogleFonts.plusJakartaSans()),
                          Text(
                            "12.23",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      StyledDivider(
                        lineStyle: DividerLineStyle.dashed,
                        height: 2,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Price",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      ItemTransactionDetails(
                        label: "Magic White",
                        qty: 2,
                        totalPrice: 60000,
                      ),
                      ItemTransactionDetails(
                        label: "Kopi Susu Tetangga",
                        qty: 4,
                        totalPrice: 94000,
                      ),
                      ItemTransactionDetails(
                        label: "Black Summer",
                        qty: 1,
                        totalPrice: 25000,
                      ),
                      ItemTransactionDetails(
                        label: "Cappucino",
                        qty: 3,
                        totalPrice: 80000,
                      ),
                      StyledDivider(
                        lineStyle: DividerLineStyle.dashed,
                        height: 2,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Payment",
                            style: GoogleFonts.plusJakartaSans(),
                          ),
                          Text(
                            "Rp 400.000",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tax 10%", style: GoogleFonts.plusJakartaSans()),
                          Text(
                            "Rp 40.000",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment Total",
                            style: GoogleFonts.plusJakartaSans(),
                          ),
                          Text(
                            "Rp 440.000",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      StyledDivider(
                        lineStyle: DividerLineStyle.dashed,
                        height: 2,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => MainScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              foregroundColor: Colors.white,
                              elevation: 0,
                            ),
                            child: Text("Back to Home"),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.primary,
                              foregroundColor: Colors.white,
                              elevation: 0,
                            ),
                            child: Text("Print Receipt"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(14),
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 0.1),
                  ),
                  child: Image.network(
                    "https://storage.googleapis.com/paxelmarket_v3_bucket/migration-prod/2022/09/cropped-Logo-TUKU-Kopi.png",
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
