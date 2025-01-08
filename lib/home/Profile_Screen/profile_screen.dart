import 'package:flutter/material.dart';

import 'Edit_Profile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = 'John Doe';
  String _email = 'john.doe@example.com';
  String _phone = '+123 456 789';
  String _address = '123, Main Street, New York';
  String _birthday = 'Jan 1, 1990';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [

          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),

                // Profile Picture and Name Section
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.18,
                        backgroundImage: AssetImage('image/anim.png'), // Profile image
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        _name, // Display the updated name
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height*0.01),
                      Text(
                        _email, // Display the updated email
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // Profile Information Cards
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      children: [
                        _buildProfileInfoCard(
                          icon: Icons.phone,
                          title: "Phone",
                          subtitle: _phone, // Display the updated phone number
                          iconColor: Colors.purple,
                        ),
                        _buildProfileInfoCard(
                          icon: Icons.location_on,
                          title: "Address",
                          subtitle: _address, // Display the updated address
                          iconColor: Colors.orange,
                        ),
                        _buildProfileInfoCard(
                          icon: Icons.cake,
                          title: "Birthday",
                          subtitle: _birthday, // Display the updated birthday
                          iconColor: Colors.green,
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        // Edit Profile Button
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              // Navigate to Edit Profile Screen and wait for the result
                              var updatedData = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfileScreen(
                                    initialName: _name,
                                    initialEmail: _email,
                                    initialPhone: _phone,
                                    initialAddress: _address,
                                    initialBirthday: _birthday,
                                  ),
                                ),
                              );

                              // If the user updated the profile, refresh the profile screen
                              if (updatedData != null) {
                                setState(() {
                                  _name = updatedData['name'];
                                  _email = updatedData['email'];
                                  _phone = updatedData['phone'];
                                  _address = updatedData['address'];
                                  _birthday = updatedData['birthday'];
                                });
                              }
                            },
                            icon: Icon(Icons.edit, color: Colors.white),
                            label: Text(
                              "Edit Profile",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 10,
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for Profile Info Cards
  Widget _buildProfileInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      color: Colors.pink.shade50,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
