import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Cart_Screen/Cart_Screen.dart';

class ShoeDetailScreen extends StatefulWidget {
  final Map<String, dynamic> shoe;

  ShoeDetailScreen({required this.shoe});

  @override
  _ShoeDetailScreenState createState() => _ShoeDetailScreenState();
}

class _ShoeDetailScreenState extends State<ShoeDetailScreen> {
  String _selectedSize = 'Select Size';
  late Timer _offerTimer;
  late Duration _remainingOfferTime;
  static List<Map<String, dynamic>> _cart = [];
  String _addToCartText = 'Add to Cart';  // State for the button text

  @override
  void initState() {
    super.initState();

    // Timer for offer countdown (e.g., 30 minutes offer timer)
    _remainingOfferTime = Duration(minutes: 30);
    _offerTimer = Timer.periodic(Duration(seconds: 1), _updateOfferTime);
  }

  @override
  void dispose() {
    _offerTimer.cancel();
    super.dispose();
  }

  // Function to update the remaining offer time
  void _updateOfferTime(Timer timer) {
    if (_remainingOfferTime.inSeconds > 0) {
      setState(() {
        _remainingOfferTime -= Duration(seconds: 1);
      });
    } else {
      _offerTimer.cancel();
    }
  }

  // Function to add item to cart
  void _addToCart() {
    if (_selectedSize != 'Select Size') {
      final cartItem = {
        'name': widget.shoe['name'],
        'image': widget.shoe['image'],
        'price': widget.shoe['price'],
        'size': _selectedSize,
      };

      setState(() {
        _cart.add(cartItem); // Add selected shoe to cart
        _addToCartText = 'Already Added On Cart';  // Change button text
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select a size')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final shoeName = widget.shoe['name'] ?? 'Unknown Shoe';
    final shoeImage = widget.shoe['image'] ?? 'assets/default_image.png';
    final shoePrice = widget.shoe['price'] ?? '\$0';
    final shoeDescription = widget.shoe['description'] ?? 'No description available';
    final backgroundColor = widget.shoe['backgroundColor'] ?? Colors.blue[50];
    final deliveryCharge = widget.shoe['deliveryCharge'] ?? '\$5.00';
    final deliveryTime = widget.shoe['deliveryTime'] ?? '3-5 business days';
    final replacementPolicy = widget.shoe['replacementPolicy'] ?? '30 days return policy';

    List<String> descriptionLines = shoeDescription.split('\n');
    List<String> shoeSizes = ['7', '8', '9', '10', '11', '12'];


    return Scaffold(
      appBar: AppBar(
        title: Text(
          shoeName,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: Colors.black54),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: _cart),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: backgroundColor.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      shoeImage,
                      fit: BoxFit.contain,
                      height: MediaQuery.sizeOf(context).height * 0.4,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 140.0),
                  child: Text(
                    shoeName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: [Colors.pink, Colors.purple],
                        ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(right: 290.0),
                  child: Text(
                    shoePrice,
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

                // Shoe Size Picker
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Size:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: shoeSizes.map((size) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedSize = size;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: _selectedSize == size ? Colors.pink[100] : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.pink),
                                boxShadow: [
                                  if (_selectedSize == size)
                                    BoxShadow(
                                      color: Colors.pink.withOpacity(0.3),
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                    ),
                                ],
                              ),
                              child: Text(
                                size,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _selectedSize == size ? Colors.pink[800] : Colors.black,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                      Text(
                        'Selected Size: $_selectedSize',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                    ],
                  ),
                ),

                // Description with bullet points
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: descriptionLines.map((line) {
                      return AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: 1.0,
                        child: Row(
                          children: [
                            Icon(Icons.circle, size: 8, color: Colors.pink[200]),
                            SizedBox(width: MediaQuery.sizeOf(context).width * 0.01),
                            Expanded(
                              child: Text(
                                line,
                                style: TextStyle(fontSize: 16, color: Colors.black54),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

                // Delivery Time, Delivery Charge, Replacement Policy
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Time: $deliveryTime',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                      Text(
                        'Delivery Charge: $deliveryCharge',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                      Text(
                        'Replacement Policy: $replacementPolicy',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

                // Add to Cart button with dynamic text
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: ElevatedButton(
                    onPressed: _addToCart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text(
                        _addToCartText,  // Dynamically show text
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
