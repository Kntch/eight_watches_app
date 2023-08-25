// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eight_watches_app/components/cart_item.dart';
import 'package:eight_watches_app/models/cart.dart';
import 'package:eight_watches_app/models/watch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
              itemCount: value.getUserWatch().length,
              itemBuilder: (context, index) {
                Watch individualWatch = value.getUserWatch()[index];
                return CartItem(watch: individualWatch);
              },
            ))
          ],
        ),
      ),
    );
  }
}
