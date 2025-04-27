import 'package:flutter/material.dart';
import 'package:smart_hotel/core/widgets/app_appbar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6FF),
      appBar: AppAppbar(title: "Favorites"),
      body: const Center(
        child: Text(
          "No favorites yet",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }
}
