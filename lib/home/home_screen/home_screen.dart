import 'package:flutter/material.dart';
import 'package:shoesapp/home/home_screen/second_Screen.dart';
// Assuming the Favorites screen is here
import '../Search_Screen/Show_Screen_Detail.dart'; // Assuming the Show Detail screen is here
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _topContainerColor = Colors.teal[300]!;
  String _imagePath = "image/anim.png";

  final List<Map<String, dynamic>> _shoeList = [
    {
      "name": "Nike Air",
      "image": "image/anim.png",
      "price": "\$120",
      "description": "Comfortable running shoes for everyday use.",
      "isFavorite": false
    },
    {
      "name": "Adidas Runner",
      "image": "image/shoes2.png",
      "price": "\$150",
      "description": "Perfect shoes for track and field enthusiasts.",
      "isFavorite": false
    },
    {
      "name": "Puma Classic",
      "image": "image/shoes3.png",
      "price": "\$100",
      "description": "Stylish and comfortable sneakers for casual wear.",
      "isFavorite": false
    },
    {
      "name": "Skechers Comfort",
      "image": "image/lady.png",
      "price": "\$90",
      "description": "Designed for all-day comfort and support.",
      "isFavorite": false
    },
    {
      "name": "Reebok Trainer",
      "image": "image/shoes4.png",
      "price": "\$110",
      "description": "Durable and versatile shoes for workouts and sports.",
      "isFavorite": false
    },
  ];


  TextEditingController _searchController = TextEditingController();





  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  final PageController _pageController = PageController();
  double _position = 0.0; // The position to animate within the page

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),



            // PageView Slider for Promotions
            SizedBox(
              height: screenHeight * 0.25,
              child:
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: // PageView Slider for Promotions
                // PageView Slider for Promotions
                SizedBox(
                  height: screenHeight * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          _position = page * 100.0; // Change the position based on page index
                        });
                      },
                      children: [
                        // Page 1 (Adidas Runner)
                        GestureDetector(
                          onTap: () {
                            // Navigate to the Adidas Runner shoe details screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShoeDetailScreen(
                                  shoe: {
                                    "name": "Adidas Runner",
                                    "image": "image/shoes2.png",
                                    "price": "\$150",
                                    "description": "Perfect shoes for track and field enthusiasts.",
                                    "isFavorite": false,
                                  },
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.lightBlue.shade100,  // Blue container
                            ),
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 40,
                                  left: 110,
                                  child: Text(
                                    "   Adidas Runner",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      shadows: [Shadow(blurRadius: 5, color: Colors.pink.shade50)],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  right: 50,
                                  child: Text(
                                    " Comfort",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      shadows: [Shadow(blurRadius: 5, color: Colors.pink.shade50)],
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeInOut,
                                  left: _position,
                                  top: 0,
                                  right: 200,
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width * 0.5,
                                    height: MediaQuery.sizeOf(context).height * 0.25,
                                    alignment: Alignment.center,
                                    child: Image.asset("image/shoes2.png", fit: BoxFit.fill),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Page 2 (Puma Classic)
                        GestureDetector(
                          onTap: () {
                            // Navigate to the Puma Classic shoe details screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShoeDetailScreen(
                                  shoe: {
                                    "name": "Puma Classic",
                                    "image": "image/shoes3.png",
                                    "price": "\$100",
                                    "description": "Stylish and comfortable sneakers for casual wear.",
                                    "isFavorite": false,
                                  },
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green.shade200,
                            ),
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height,
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeInOut,
                                  left: _position,
                                  top: 0,
                                  right: -70,
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width * 0.5,
                                    height: MediaQuery.sizeOf(context).height * 0.25,
                                    alignment: Alignment.center,
                                    child: Image.asset("image/shoes3.png", fit: BoxFit.fill),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: Text(
                                    "Puma ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      shadows: [Shadow(blurRadius: 5, color: Colors.green)],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  left: 20,
                                  child: Text("comfort and performance", style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Page 3 (Reebok Trainer)
                        GestureDetector(
                          onTap: () {
                            // Navigate to the Reebok Trainer shoe details screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShoeDetailScreen(
                                  shoe: {
                                    "name": "Reebok Trainer",
                                    "image": "image/shoes4.png",
                                    "price": "\$110",
                                    "description": "Durable and versatile shoes for workouts and sports.",
                                    "isFavorite": false,
                                  },
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red.shade200,
                            ),
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height,
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn,
                                  left: _position,
                                  top: 10,
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width * 0.5,
                                    height: MediaQuery.sizeOf(context).height * 0.25,
                                    alignment: Alignment.center,
                                    child: Image.asset("image/shoes4.png"),
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  left: 20,
                                  child: Text(
                                    "Reebok",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      shadows: [Shadow(blurRadius: 5, color: Colors.red)],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 60,
                                  left: 70,
                                  child: Text(
                                    " Limited Edition",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ),),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.black54,
                  dotColor: Colors.grey.shade400,
                ),
              ),
            ),
            // Search Bar


            // Display filtered shoes list (only when there are results)


            SizedBox(height: screenHeight * 0.02),


            // Horizontal List Below Search Bar without category names
            Text("      Choose Colours", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              height: screenHeight * 0.05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                itemBuilder: (context, index) {
                  final colors = [
                    Colors.blue[100]!,
                    Colors.green[100]!,
                    Colors.orange[100]!,
                    Colors.red[100]!,
                    Colors.purple[100]!,
                  ];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _topContainerColor = colors[index];
                      });
                    },
                    child: Container(
                      width: screenWidth * 0.24,
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: screenHeight * 0.02),
            Text(
              "    Trending ",
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: screenHeight * 0.45,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              decoration: BoxDecoration(
                color: _topContainerColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenContainer(
                        containerColor: _topContainerColor,
                        imagePath: _imagePath, shoeDetails: {},
                      ),
                    ),
                  );
                },
                child: AnimatedScale(
                  scale: 1.0,
                  duration: Duration(milliseconds: 300),
                  child: Image.asset(_imagePath),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            // Horizontal List at Bottom
            SizedBox(
              height: screenHeight * 0.14,
              child:
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                itemBuilder: (context, index) {
                  final images = [
                    "image/anim.png",
                    "image/shoes2.png",
                    "image/shoes3.png",
                    "image/lady.png",
                    "image/shoes4.png",
                  ];
                  final colors = [
                    Colors.orange[100]!,
                    Colors.red[100]!,
                    Colors.green[200]!,
                    Colors.blue[100]!,
                    Colors.red[100]!,
                  ];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _imagePath = images[index];
                        _topContainerColor = colors[index];
                      });
                    },
                    child: Container(
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.12,
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(images[index]),
                    ),
                  );},
              ),),

            // GridView for Popular Shoes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
              child: Text(
                "Popular Shoes",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black54),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _shoeList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final shoe = _shoeList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoeDetailScreen(shoe: shoe),
                      ),);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(shoe['image'], height: 80),
                        SizedBox(height: 10),
                        Text(shoe['name'], style: TextStyle(fontSize: 18)),
                        Text(shoe['price'], style: TextStyle(fontSize: 16, color: Colors.green)),
                      ],
                    ),
                  ),);
              },),

            SizedBox(height: screenHeight * 0.02),
          ],),
      ),);
  }

  // Helper method to build slider cards
  Widget _buildSliderCard(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 5, color: Colors.black)],
              ),),
          ),],
      ),);
  }}
