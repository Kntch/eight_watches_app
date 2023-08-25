// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eight_watches_app/models/cart.dart';
import 'package:eight_watches_app/models/watch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/watch_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add Watch to Cart Method
  void addItemsToCart(Watch watch) {
    Provider.of<Cart>(context, listen: false).addItemsToCart(watch);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Item added successfully!!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "search",
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search_rounded,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              "always judge a man by his shoes and his watch",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hot deals 🔥",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "see all",
                  style: TextStyle(color: Colors.blue[800]),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Watch watch = value.getWatchList()[index];
                return WatchTile(
                  watch: watch,
                  onTap: () => addItemsToCart(watch),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
