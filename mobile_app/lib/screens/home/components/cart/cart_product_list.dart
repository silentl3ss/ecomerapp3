import 'package:e_commerce/helpers/widgets/rounded_image.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:get/get.dart';

import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/widgets/item_detail/item_detail_screen.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/widgets/custom_tile.dart';

class CartProductList extends StatelessWidget {
  const CartProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return SizedBox(
        height: 0.6.sh,
        child: ListView.builder(
          itemCount: controller.checkoutProducts.length,
          itemBuilder: (context, index) {
            final product = controller.checkoutProducts[index];
            product.quantity = product.quantity == 0 ? 1 : product.quantity;
            return CustomTile(
              height: 80,
              leading: GestureDetector(
                  onTap: () {
                    changePage(ItemDetailScreen.routeName,
                        arguments: {'product': product});
                  },
                  child: RoundedImage(
                    imageUrl: product.images.first,
                    radius: 25,
                  )),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title ?? '',
                  style: AppDecoration.boldStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              subTitle: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: EasyRichText(
                  product.size ?? 'M',
                  patternList: [
                    EasyRichTextPattern(
                      targetString: product.size ?? 'M',
                      style: AppDecoration.boldStyle(
                        fontSize: 11,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${product.price}',
                    style: AppDecoration.boldStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  5.verticalSpace,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => controller.increaseQuantity(product),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColors.lightPurple,
                          child: Center(
                              child: Text(
                            '+',
                            style: AppDecoration.mediumStyle(
                              fontSize: 13,
                              color: AppColors.pureWhite,
                            ),
                          )),
                        ),
                      ),
                      5.horizontalSpace,
                      Text(
                        '${product.quantity}',
                        style: AppDecoration.boldStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      5.horizontalSpace,
                      GestureDetector(
                        onTap: () => controller.decreaseQuantity(product),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColors.lightPurple,
                          child: Center(
                              child: Text(
                            "−",
                            style: AppDecoration.mediumStyle(
                              fontSize: 13,
                              color: AppColors.pureWhite,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
