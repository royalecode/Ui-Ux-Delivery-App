
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/src/ui/global_controllers/my_cart_controller.dart';
import 'package:ui_ux/src/ui/pages/dish/dish_controller.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/models/dish.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../../utils/font_styles.dart';

class DishHomeItem extends StatelessWidget {
  const DishHomeItem({
    Key key,
    @required this.item, 
    @required this.isFirst, 
  }) : super(key: key);

  final bool isFirst;
  final Dish item;

  String get tag => "${this.key.toString()}-${item.id}";

  void _goToDetail(BuildContext context) {
    final int counter = context.read<MyCartController>().getDishCounter(this.item);
    final Dish dish = item.updateCounter(counter);

    Navigator.pushNamed(
      context,
      Routes.DISH,
      arguments: DishPageArguments(dish: dish, tag: this.tag),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ).copyWith(left: isFirst ? 17 : 0),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              Hero(
                tag: this.tag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    item.photo,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: -1,
                child: Container(
                  padding: EdgeInsets.all(10).copyWith(
                    top: 50,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0),
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.9),
                          Colors.white,
                        ],
                        stops: const [
                          0.1,
                          0.2,
                          0.3,
                          0.5,
                          1
                        ]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: FontStyles.regular.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "\$",
                              style: FontStyles.regular.copyWith(
                                  color: primaryColor,
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic),
                              children: [
                                TextSpan(
                                  text: " ${item.price}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                            ).copyWith(left: 4),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  "${item.rate}",
                                  style: FontStyles.normal.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          onPressed: () => _goToDetail(context),
        ),
      ),
    );
  }
}
