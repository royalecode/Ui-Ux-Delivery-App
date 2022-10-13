


import 'package:flutter/widgets.dart';
import 'package:ui_ux/src/data/models/onboard_item.dart';

class OnboardController extends ChangeNotifier {

  final List<OnBoardItem> items = [
    OnBoardItem(
      image: "assets/pages/onboard/slider-1.svg",
      title: "Lorem ipsum dolor sit amet",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
    ),
    OnBoardItem(
      image: "assets/pages/onboard/slider-2.svg",
      title: "Neque porro quisquam est qui dolorem",
      description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical",
    ),
    OnBoardItem(
      image: "assets/pages/onboard/slider-3.svg",
      title: "The standard chunk of Lorem Ipsum",
      description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form",
    ),
  ];

  final PageController pageController = PageController();
  double _currentPage = 0;
  double get currentPage => _currentPage;

  void afterFirstLayout() {
    pageController.addListener(() {
      final double page = pageController.page;
      _currentPage = page;
      notifyListeners();
      // if (page%1==0 && _currentPage != page) {
      //   _currentPage = page;
      //   notifyListeners();
      //   print("current page ${pageController.page}");
      // }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}