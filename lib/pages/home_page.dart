// ignore_for_file: prefer_const_constructors

import 'package:eight_watches_app/components/bottom_nav.dart';
import 'package:eight_watches_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to disply
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            color: Colors.black,
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                //logo
                DrawerHeader(
                    child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset('lib/images/logo.png'),
                )),
                Divider(
                  color: Colors.grey[100],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Orders",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Container(
                  height: 400,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      "logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )

                //other pages
              ]),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
    return scaffold;
  }
}
