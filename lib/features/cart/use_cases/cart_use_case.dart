import 'package:pos_ai_powered/features/cart/models/cart_product.dart';
import 'package:pos_ai_powered/features/product/domain/entities/product.dart';

class CartUseCase {
  int add({required Map<int, CartProduct> cart, required Product product}) {
    final existing = cart[product.id];

    if (existing == null) {
      cart[product.id] = CartProduct(product: product, numOfItem: 1);
    } else {
      existing.numOfItem += 1;
    }

    return _totalItems(cart);
  }

  List<CartProduct>? cartItems;

  int remove({required Map<int, CartProduct> cart, required int productId}) {
    final existing = cart[productId];
    if (existing == null) return _totalItems(cart);

    if (existing.numOfItem <= 1) {
      cart.remove(productId);
    } else {
      existing.numOfItem -= 1;
    }

    return _totalItems(cart);
  }

  int getQty({required Map<int, CartProduct> cart, required int productId}) {
    return cart[productId]?.numOfItem ?? 0;
  }

  int _totalItems(Map<int, CartProduct> cart) {
    return cart.values.fold(0, (sum, item) => sum + item.numOfItem);
  }

  num subTotal({required Map<int, CartProduct> cart}) {
    return cart.values.fold<num>(
      0,
      (sum, cartProduct) =>
          sum + (cartProduct.product.price * cartProduct.numOfItem),
    );
  }

  num tax({required Map<int, CartProduct> cart, num rate = 10}) {
    return (subTotal(cart: cart) * rate / 100).toInt();
  }

  num total({required Map<int, CartProduct> cart, num taxRate = 10}) {
    final subTotalValue = subTotal(cart: cart);
    final taxValue = tax(cart: cart, rate: taxRate).toInt();
    return subTotalValue + taxValue;
  }
}
