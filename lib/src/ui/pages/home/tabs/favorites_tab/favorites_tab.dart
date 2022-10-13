
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/pages/home/tabs/favorites_tab/widgets/favorite_item.dart';

import '../../../../../data/models/dish.dart';
import '../../home_controller.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({Key key}) : super(key: key);

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final favorites = context.select<HomeController, Map<int, Dish>>((_) => _.favorites).values.toList();

    return ListView.builder(
      itemBuilder: (_, index) => FavoriteItem(dish: favorites[index]),
      itemCount: favorites.length,
    );;
  }
  
  @override
  bool get wantKeepAlive => true;
}