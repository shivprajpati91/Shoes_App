import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> shoeList;

  FavoritesScreen({required this.shoeList});

  @override
  Widget build(BuildContext context) {
    // Filter the favorite shoes
    final List<Map<String, dynamic>> favoriteShoes = shoeList
        .where((shoe) => shoe['isFavorite'] == true)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Shoes"),
        backgroundColor: Colors.pink[50],
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: favoriteShoes.isEmpty
          ? Center(
        child: Text(
          "No favorite shoes.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: favoriteShoes.length,
        itemBuilder: (context, index) {
          final shoe = favoriteShoes[index];
          return ListTile(
            leading: Image.asset(shoe['image'], width: 50, height: 50),
            title: Text(shoe['name']),
            subtitle: Text(shoe['price']),
            trailing: Icon(Icons.favorite, color: Colors.red),
          );
        },
      ),
    );
  }
}
