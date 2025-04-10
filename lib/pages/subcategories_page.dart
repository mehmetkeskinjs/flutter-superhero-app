import 'package:flutter/material.dart';

class SubcategoriesPage extends StatelessWidget {
  final String categoryName;
  final List<String> subcategories;

  const SubcategoriesPage({
    super.key,
    required this.categoryName,
    required this.subcategories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        foregroundColor: Colors.white,
        toolbarHeight: 64,
        titleTextStyle: TextStyle(fontSize: 24),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          final subcategory = subcategories[index];
          return Card(
            elevation: 4,
            child: InkWell(
              onTap: () {
                // TODO: Handle subcategory selection
                print('Selected: $categoryName - $subcategory');
              },
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.category, size: 32, color: Colors.black),
                    SizedBox(height: 8),
                    Text(
                      subcategory,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
