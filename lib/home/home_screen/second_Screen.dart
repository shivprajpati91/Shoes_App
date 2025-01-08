import 'package:flutter/material.dart';


import '../Search_Screen/Show_Screen_Detail.dart';
  // Import the ShoeDetailScreen file

class FullScreenContainer extends StatefulWidget {
  final Color containerColor;
  final String imagePath;
  final Map<String, dynamic> shoeDetails;  // Pass shoe details

  FullScreenContainer({
    required this.containerColor,
    required this.imagePath,
    required this.shoeDetails,
  });

  @override
  _FullScreenContainerState createState() => _FullScreenContainerState();
}

class _FullScreenContainerState extends State<FullScreenContainer> {
  double _scaleFactor = 1.0;
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _isAnimated = true;
        _scaleFactor = 1.5;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget.containerColor,
      appBar: AppBar(
        backgroundColor: widget.containerColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _isAnimated ? 1.0 : 0.0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: _isAnimated ? screenWidth * 0.8 : screenWidth * 0.5,
                height: _isAnimated ? screenHeight * 0.6 : screenHeight * 0.4,
                decoration: BoxDecoration(
                  color: widget.containerColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: _scaleFactor,
                  child: Image.asset(widget.imagePath),
                ),
              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
