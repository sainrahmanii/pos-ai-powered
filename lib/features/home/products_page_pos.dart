import 'package:flutter/material.dart';
import 'package:pos_ai_powered/features/cart/models/cart_product.dart';
import 'package:pos_ai_powered/features/cart/presentation/pages/cart_page.dart';
import 'package:pos_ai_powered/features/cart/presentation/widgets/cart_summary.dart';
import 'package:pos_ai_powered/features/cart/use_cases/cart_use_case.dart';
import 'package:pos_ai_powered/features/home/widgets/category_tab.dart';
import 'package:pos_ai_powered/features/home/widgets/product_card_widget.dart';
import 'package:pos_ai_powered/features/home/widgets/search_bar_widget.dart';
import 'package:pos_ai_powered/features/product/data/data_sources/product_local_datasource.dart';
import 'package:pos_ai_powered/features/product/data/repositories/product_repository_impl.dart';
import 'package:pos_ai_powered/features/product/domain/entities/product.dart';
import 'package:pos_ai_powered/features/product/domain/use_cases/filter_product.dart';

class ProductPagePos extends StatefulWidget {
  const ProductPagePos({super.key});

  @override
  State<ProductPagePos> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPagePos> {
  String selectedCategory = 'ALL';
  String searchText = '';

  late final FilterProductsUseCase filterUseCase;
  int totalItems = 0;
  final Map<int, CartProduct> cart = {};
  late final CartUseCase cartUseCase;

  @override
  void initState() {
    super.initState();
    filterUseCase = FilterProductsUseCase(ProductRepositoryImpl());
    cartUseCase = CartUseCase();
  }

  void onSearch(String value) {
    setState(() => searchText = value);
  }

  void onCategoryChange(String category) {
    setState(() => selectedCategory = category);
  }

  void add(Product product) {
    setState(() {
      totalItems = cartUseCase.add(cart: cart, product: product);
    });
  }

  void remove(int productId) {
    setState(() {
      totalItems = cartUseCase.remove(cart: cart, productId: productId);
    });
  }

  int getQty(int id) {
    return cartUseCase.getQty(cart: cart, productId: id);
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = filterUseCase.execute(
      category: selectedCategory,
      products: products,
      keyword: searchText,
    );

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  SearchBarWidget(onChanged: onSearch),
                  const SizedBox(height: 16),
                  CategoryTabs(
                    selected: selectedCategory,
                    onTap: onCategoryChange,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            SliverPadding(
              padding: EdgeInsetsGeometry.all(0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = filteredProducts[index];
                  return ProductCardWidget(
                    product: item,
                    qty: getQty(item.id),
                    onAdd: () => add(item),
                    onRemove: () => remove(item.id),
                  );
                }, childCount: filteredProducts.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.82,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 120)),
          ],
        ),

        if (totalItems > 0)
          Positioned(
            left: 12,
            right: 12,
            bottom: 20,
            child: CartSummary(
              totalItems: totalItems,
              cart: cart,
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CartPage(cartItems: cart)),
                );
                setState(() {
                  totalItems = cart.values.fold<int>(
                    0,
                    (sum, cartPage) => sum + cartPage.numOfItem,
                  );
                });
              },
            ),
          ),
      ],
    );
  }
}
