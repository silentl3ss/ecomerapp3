import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:get/get.dart';

import '../../../../helpers/widgets/header.dart';
import 'cart_content.dart';
import 'package:flutter/material.dart';

import 'empty_cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
            child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              const Header(
                text: 'Cart',
                extraSpace: 10,
              ),
              controller.checkoutProducts.isEmpty
                  ? const EmptyCart()
                  : const CartContent(),
            ],
          ),
        )),
      );
    });
  }
}
