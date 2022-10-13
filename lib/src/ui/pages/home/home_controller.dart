import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter/widgets.dart';

import '../../../data/models/dish.dart';

class HomeController extends ChangeNotifier implements TickerProvider {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  Map<int, Dish> _favorites = {};
  Map<int, Dish> get favorites => _favorites;
  bool isFavorite(Dish dish) => _favorites.containsKey(dish.id);

  void Function() onDispose;

  HomeController() {
    _init();
  }

  TabController tabController;

  void afterFistLayout() {
    this.tabController.addListener(() {
      _currentPage = tabController.index;
      notifyListeners();
    });
  }

  void toggleFavorite(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_favorites);
    if (isFavorite(dish)) {
      copy.remove(dish.id);
    } else {
      copy[dish.id] = dish;
    }
    _favorites = copy;
    notifyListeners();
  }

  void deleteFavorite(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_favorites);
    if (isFavorite(dish)) {
      copy.remove(dish.id);
      _favorites = copy;
      notifyListeners();
    }
  }

  void _init() async {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    this.tabController.dispose();
    if (this.onDispose != null) {
      this.onDispose();
    }
    super.dispose();
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
