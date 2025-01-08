import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String initialName;
  final String initialEmail;
  final String initialPhone;
  final String initialAddress;
  final String initialBirthday;

  EditProfileScreen({
    required this.initialName,
    required this.initialEmail,
    required this.initialPhone,
    required this.initialAddress,
    required this.initialBirthday,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _phone;
  late String _address;
  late String _birthday;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _name = widget.initialName;
    _email = widget.initialEmail;
    _phone = widget.initialPhone;
    _address = widget.initialAddress;
    _birthday = widget.initialBirthday;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.pink.shade100,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Picture Section (Optional, if you want a profile image)
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Implement image picker logic
                    },
                    child: CircleAvatar(
                      radius: screenWidth * 0.2,
                      backgroundImage: AssetImage('image/anim.png'), // Placeholder profile image
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Name Field
                TextFormField(
                  initialValue: _name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.pink.shade50,
                  ),
                  onChanged: (value) {
                    _name = value;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),

                // Email Field
                TextFormField(
                  initialValue: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.pink.shade50,
                  ),
                  onChanged: (value) {
                    _email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),

                // Phone Field
                TextFormField(
                  initialValue: _phone,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.pink.shade50,
                  ),
                  onChanged: (value) {
                    _phone = value;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),

                // Address Field
                TextFormField(
                  initialValue: _address,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.pink.shade50,
                  ),
                  onChanged: (value) {
                    _address = value;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),

                // Birthday Field
                TextFormField(
                  initialValue: _birthday,
                  decoration: InputDecoration(
                    labelText: 'Birthday',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.pink.shade50,
                  ),
                  onChanged: (value) {
                    _birthday = value;
                  },
                ),
                SizedBox(height: screenHeight * 0.03),

                // Save Changes Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isEditing = true; // Set editing status
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Profile Updated!')),
                        );

                        // Return the updated values to the ProfileScreen
                        Navigator.pop(context, {
                          'name': _name,
                          'email': _email,
                          'phone': _phone,
                          'address': _address,
                          'birthday': _birthday,
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      elevation: 10,
                    ),
                    child: _isEditing
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                      "Save Changes",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Cancel Button (Optional)
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 16, color: Colors.pink.shade300),
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
