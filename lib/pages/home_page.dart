import 'dart:math';

import 'package:flutter/material.dart';
import 'package:superhero/data/quote_data.dart';
import 'package:superhero/models/quote.dart';
import 'package:superhero/pages/favorites_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pickedNumber = 0;
  Quote? currentQuote;
  int _selectedIndex = 0;

  void getRandomQuote() {
    setState(() {
      _pickedNumber = Random().nextInt(20);

      currentQuote = quotes.firstWhere(
        (q) => q.id == _pickedNumber,
        orElse: () => Quote(id: 0, text: 'No quote found'),
      );
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        title: Text('One Quote'),
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        foregroundColor: Colors.white,
        toolbarHeight: 64,
        titleTextStyle: TextStyle(fontSize: 24),
      ),
      body:
          _selectedIndex == 0
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        currentQuote?.text ?? 'Press the button to get a quote',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 30,
                        ),
                      ),
                      onPressed: () {
                        getRandomQuote();
                      },
                      child: Text(
                        'Get New Quote',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 30,
                        ),
                      ),
                      onPressed: () {
                        print('quote added to your favorites');
                      },
                      child: Text(
                        'I like this quote',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )
              : FavoritesPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(32, 0, 0, 0),
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        iconSize: 35,
        selectedItemColor: Colors.black,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
      ),
    );
  }
}
