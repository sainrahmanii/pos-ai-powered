import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ai_powered/features/cart/models/cart_product.dart';
import 'package:pos_ai_powered/features/cart/presentation/widgets/choice_container.dart';
import 'package:pos_ai_powered/features/cart/presentation/widgets/choice_payment.dart';
import 'package:pos_ai_powered/features/cart/presentation/widgets/item_cart.dart';
import 'package:pos_ai_powered/features/cart/presentation/widgets/order_summary.dart';
import 'package:pos_ai_powered/features/cart/use_cases/cart_use_case.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';

class CartPage extends StatefulWidget {
  final Map<int, CartProduct> cartItems;
  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Map<int, CartProduct> _cartItems;
  late final CartUseCase _cartUseCase;
  String _orderType = "dinein";
  String _paymentType = "qris";

  @override
  void initState() {
    super.initState();
    _cartItems = widget.cartItems;
    _cartUseCase = CartUseCase();
  }

  @override
  Widget build(BuildContext context) {
    final List<CartProduct> cartProduct = _cartItems.values.toList();
    final num subTotal = _cartUseCase.subTotal(cart: _cartItems);
    final num tax = _cartUseCase.tax(cart: _cartItems);
    final num total = _cartUseCase.total(cart: _cartItems);
    return Scaffold(
      backgroundColor: Color(0xFFf8fafc),
      appBar: AppBar(
        title: Text("Order Details"),
        backgroundColor: Color(0xFFf8fafc),
        surfaceTintColor: Color(0xFFf8fafc),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 20,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: ColorConstant.primary.withOpacity(0.1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChoiceContainer(
                          label: "Take Away",
                          selected: _orderType == "takeaway",
                          onTap: () => setState(() => _orderType = 'takeaway'),
                        ),
                        ChoiceContainer(
                          label: "Dine-In",
                          selected: _orderType == "dinein",
                          onTap: () => setState(() => _orderType = 'dinein'),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChoicePayment(
                        icon: Icons.euro_rounded,
                        label: "CASH",
                        selected: _paymentType == "cash",
                        onTap: () => setState(() => _paymentType = "cash"),
                      ),
                      ChoicePayment(
                        icon: Icons.qr_code_scanner_outlined,
                        label: "QRIS",
                        selected: _paymentType == "qris",
                        onTap: () => setState(() => _paymentType = "qris"),
                      ),
                      ChoicePayment(
                        icon: Icons.credit_card_rounded,
                        label: "CARD",
                        selected: _paymentType == "card",
                        onTap: () => setState(() => _paymentType = "card"),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(6),
                      hintText: "Customer Name...",
                      hintStyle: GoogleFonts.plusJakartaSans(
                        color: Colors.grey.shade600,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 300),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: cartProduct.length,
                    itemBuilder: (context, index) {
                      final CartProduct cart = cartProduct[index];
                      final int productId = cart.product.id;
                      return Dismissible(
                        key: ValueKey(productId),
                        onDismissed: (direction) {
                          setState(() {
                            _cartItems.remove(productId);
                          });
                        },
                        background: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        child: ItemCart(cartProduct: cart),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          OrderSummary(subTotal: subTotal, tax: tax, total: total),
        ],
      ),
    );
  }
}
