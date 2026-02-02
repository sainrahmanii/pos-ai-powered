import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ai_powered/features/product/data/data_sources/product_local_datasource.dart';
import 'package:pos_ai_powered/features/product/domain/entities/product.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(vertical: 4),
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        return CardProductWidget(product: products[index]);
      },
    );
  }
}

class CardProductWidget extends StatelessWidget {
  const CardProductWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(product.id.toString()),
      endActionPane: ActionPane(
        extentRatio: 0.45,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Removed from favourite'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: Icons.edit,
            label: 'Edit',
            backgroundColor: ColorConstant.primary,
          ),
          SlidableAction(
            onPressed: (context) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Removed from favourite'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: Colors.red,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
        ],
      ),
      child: Row(
        spacing: 14,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              product.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                product.category,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: ColorConstant.primary,
                ),
              ),
              Text(
                "Rp ${product.price}",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
