import 'package:eight_watches_app/models/watch.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Watch> watchShop = [
    Watch(
        name: "GCC Kuwait Edition",
        price: "83 KD",
        imagePath: "lib/images/kuwait.png",
        description:
            "Stainless steel. Ultra-thin Quartz. Case size 41mm. Arabic-Hindu numerals. Waterproof"),
    Watch(
        name: "GCC Qatar Edition",
        price: "83 KD",
        imagePath: "lib/images/qatar.png",
        description:
            "Stainless steel. Ultra-thin Quartz. Case size 41mm. Arabic-Hindu numerals. Waterproof"),
    Watch(
        name: "GCC Oman Edition",
        price: "83 KD",
        imagePath: "lib/images/oman.png",
        description:
            "Stainless steel. Ultra-thin Quartz. Case size 41mm. Arabic-Hindu numerals. Waterproof"),
    Watch(
        name: "GCC Saudi Edition",
        price: "83 KD",
        imagePath: "lib/images/saudi.png",
        description:
            "Stainless steel. Ultra-thin Quartz. Case size 41mm. Arabic-Hindu numerals. Waterproof"),
    Watch(
        name: "Arabic Rose Gold",
        price: "83 KD",
        imagePath: "lib/images/rose.png",
        description:
            "Rose Gold Carbon fiber. Ultra-thin Quartz. Case size 41mm. Arabic-Hindu numerals. Waterproof")
  ];

  // list of items in user cart
  List<Watch> userCart = [];
  // get list of items for sale
  List<Watch> getWatchList() {
    return watchShop;
  }

  // get cart
  List<Watch> getUserWatch() {
    return userCart;
  }

  // add items to cart
  void addItemsToCart(Watch watch) {
    userCart.add(watch);
    notifyListeners();
  }

  // remove items from the cart
  void removeItemFromCart(Watch watch) {
    userCart.remove(watch);
    notifyListeners();
  }
}
