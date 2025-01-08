import 'package:flutter/material.dart';
import 'Floating_Fov_Screen.dart'; // Assuming the Favorites screen is here
import 'Show_Screen_Detail.dart'; // Assuming the Show Detail screen is here

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> _shoeList = [
    {
      "name": "Nike Air",
      "image": "image/anim.png",
      "price": "\$120",
      "description": "Comfortable running shoes for everyday use.\n"
          "Lightweight design for optimal comfort.\n"
          "Breathable upper to keep your feet cool.\n"
          "Durable sole for enhanced traction.\n"
          "Available in a variety of colors.",
      "isFavorite": false
    },
    {
      "name": "Adidas Runner",
      "image": "image/shoes2.png",
      "price": "\$150",
      "description": "Perfect shoes for track and field enthusiasts.\n"
          "Responsive cushioning for maximum performance.\n"
          "Engineered for speed and flexibility.\n"
          "Breathable mesh upper for added comfort.\n"
          "Sleek, modern design.",
      "isFavorite": false
    },
    {
      "name": "Puma Classic",
      "image": "image/shoes3.png",
      "price": "\$100",
      "description": "Stylish and comfortable sneakers for casual wear.\n"
          "Soft fabric lining for extra comfort.\n"
          "Durable rubber outsole for superior grip.\n"
          "Versatile design to match various outfits.\n"
          "Lightweight and flexible construction.",
      "isFavorite": false
    },
    {
      "name": "Skechers Comfort",
      "image": "image/lady.png",
      "price": "\$90",
      "description": "Designed for all-day comfort and support.\n"
          "Cushioned memory foam insole for added comfort.\n"
          "Shock-absorbing sole to reduce impact.\n"
          "Perfect for long walks and everyday use.\n"
          "Classic look that goes with any outfit.",
      "isFavorite": false
    },
    {
      "name": "Reebok Trainer",
      "image": "image/shoes4.png",
      "price": "\$110",
      "description": "Durable and versatile shoes for workouts and sports.\n"
          "High-performance cushioning for intensive activities.\n"
          "Breathable mesh for comfort during exercise.\n"
          "Stable sole for excellent grip and support.\n"
          "Ideal for weight training and running.",
      "isFavorite": false
    },
  ];

  List<Map<String, dynamic>> _filteredShoes = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredShoes = _shoeList; // Initialize with all shoes
  }

  void _filterShoes(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredShoes = _shoeList;
      } else {
        _filteredShoes = _shoeList
            .where((shoe) =>
            shoe['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      _filteredShoes[index]['isFavorite'] = !_filteredShoes[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.08; // Responsive icon size based on screen width

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterShoes,
              decoration: InputDecoration(
                hintText: "Search for shoes...",
                prefixIcon: Icon(Icons.search, size: 28, color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          // Add space after the search bar
          Expanded(
            child: _filteredShoes.isEmpty
                ? Center(
              child: Text(
                "No shoes found.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
                : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15, // Increased spacing between rows
                crossAxisSpacing: 15, // Increased spacing between columns
                childAspectRatio: 3 / 4,
              ),
              itemCount: _filteredShoes.length,
              itemBuilder: (context, index) {
                final shoe = _filteredShoes[index];
                return GestureDetector(
                  onTap: () {
                    // Handle shoe tap (e.g., navigate to detail screen)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoeDetailScreen(shoe: shoe),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Image and text part of the card
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  shoe['image'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(height: 0),
                            Text(
                              shoe['name'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0),
                            Text(
                              shoe['price'],
                              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        // Favorite icon positioned at top-right
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: Icon(
                              shoe['isFavorite']
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: shoe['isFavorite'] ? Colors.red : Colors.grey,
                              size: iconSize,
                            ),
                            onPressed: () => _toggleFavorite(index),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Favorites screen (replacing Cart button)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesScreen(shoeList: _shoeList),
            ),
          );
        },
        child: Icon(Icons.favorite),
        backgroundColor: Colors.pink.shade100,
      ),
    );
  }
}
