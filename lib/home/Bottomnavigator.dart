import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'Cart_Screen/Cart_Screen.dart';
import 'Profile_Screen/profile_screen.dart';
import 'Search_Screen/search_screen.dart';
import 'home_screen/home_screen.dart';

class BottomnaviGation extends StatefulWidget {
  @override
  _BottomnaviGationState createState() => _BottomnaviGationState();
}

class _BottomnaviGationState extends State<BottomnaviGation> {
  // Current index for the CurvedNavigationBar
  int _currentIndex = 0;

  // List of screens to display
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  // User details (replace with real user data)
  String userName = "Shiv Prajapati";
  String userEmail = "shiv2397@gmail.com";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top Trend Shoes",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        backgroundColor: Colors.pink[50],
        actions: [
          // Search Icon Button
          IconButton(
            icon: Icon(Icons.search, color: Colors.black54),
            onPressed: () {
              setState(() {
                _currentIndex = 1; // Navigate to Search Screen
              });
            },
          ),

          // Cart Icon with Badge
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.black54),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen(cartItems: [],)),
                  );
                },
              ),

            ],
          ),

        ],
      ),

      drawer: _buildAnimatedDrawer(), // Use the custom drawer
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.pink.shade100,
        buttonBackgroundColor: Colors.pink.shade300!,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  // Custom Drawer with animated style
  Widget _buildAnimatedDrawer() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.pink.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Profile Header
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                  backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    userEmail,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Navigation Items
            _buildDrawerItem(
              icon: Icons.home_outlined,
              title: "Home",
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                  Navigator.pop(context);
                });
              },
            ),
            _buildDrawerItem(
              icon: Icons.search_outlined,
              title: "Search",
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                  Navigator.pop(context);
                });
              },
            ),
            _buildDrawerItem(
              icon: Icons.person_outlined,
              title: "Profile",
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                  Navigator.pop(context);
                });
              },
            ),
            Spacer(),
            Divider(
              color: Colors.pink.shade200,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            _buildDrawerItem(
              icon: Icons.logout,
              title: "Logout",
              onTap: () {
                print("Logout tapped!");
                Navigator.pop(context);
              },
              isLogout: true,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Drawer item widget
  Widget _buildDrawerItem({required IconData icon, required String title, required Function() onTap, bool isLogout = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : Colors.pink.shade200,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isLogout ? Colors.red : Colors.black87,
        ),
      ),
      onTap: onTap,
    );
  }
}
