import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global_controllers/my_cart_controller.dart';
import '../../../global_widgets/rounded_button.dart';
import '../dish_controller.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key key}) : super(key: key);

  void _addToCart(BuildContext context) {
    final MyCartController myCartController = context.read<MyCartController>();
    final DishController controller = context.read<DishController>();
    final isInCart = myCartController.isInCart(controller.dish);
    myCartController.addToCart(controller.dish);
    final SnackBar snackBar = SnackBar(
      content: Text(
        isInCart ? "Order Updated" : "Added to cart",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.deepOrange,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final DishController controller = Provider.of<DishController>(context, listen: false);
    final bool isInCart = context.select<MyCartController, bool>((_) => _.isInCart(controller.dish));

    return RoundedButton(
      label: isInCart ? "Update Order" : "Add to cart",
      onPressed: () => _addToCart(context),
      fullWidth: false,
      fontSize: 20,
    );
  }
}
