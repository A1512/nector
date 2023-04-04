import 'package:flutter/material.dart';
import 'package:grocery_app/screens/account/account_screen.dart';
import 'package:grocery_app/screens/cart/cart_screen.dart';
import 'package:grocery_app/screens/explore_screen.dart';
import 'package:grocery_app/screens/home/home_screen.dart';

class NavigatorItem1 {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem1(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem1> NavigatorItems1 = [
  NavigatorItem1("Shop", "assets/icons/shop_icon.svg", 0, HomeScreen()),
  NavigatorItem1("Orders", "assets/icons/cart_icon.svg", 1, ExploreScreen()),
  //NavigatorItem1("Cart", "assets/icons/cart_icon.svg", 2, CartScreen()),
  // NavigatorItem1(
  //     "Favourite", "assets/icons/favourite_icon.svg", 3, FavouriteScreen()),
  NavigatorItem1(
      "Account", "assets/icons/account_icon.svg", 4, AccountScreen()),
];
