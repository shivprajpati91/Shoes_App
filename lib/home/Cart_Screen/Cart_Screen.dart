import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        backgroundColor: Colors.pink[100],
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Text(
          "Your cart is empty!",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Image.asset(cartItem['image'], width: 50, height: 50),
            title: Text(cartItem['name']),
            subtitle: Text(cartItem['price']),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart, color: Colors.red),
              onPressed: () {
                // Handle item removal from cart
              },
            ),
          );
        },
      ),
    );
  }
}
