import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: Center(
        child: Text(
          'Your favorite quotes will appear here',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
