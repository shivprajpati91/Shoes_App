
import 'package:flutter/material.dart';

import 'package:shoesapp/home/Profile_Screen/profile_screen.dart';

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Settings",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),
        ),leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));

      }, icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.pink[50],
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Change Password Section
            ListTile(
              leading: Icon(Icons.lock, color: Colors.pink),
              title: Text(
                "Change Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Handle password change
              },
            ),
            Divider(),
            // Delete Account Section
            ListTile(
              leading: Icon(Icons.delete_forever, color: Colors.pink),
              title: Text(
                "Delete Account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Handle account deletion
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
