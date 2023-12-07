import 'package:flutter/material.dart';
import 'CategoryDetailsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Books App'),
        ),
        body: GridView.count(
          crossAxisCount: 2, // 2 columnas
          children: <Widget>[
            CategoryTile(
              title: 'novel',
              imagePath: 'Images/novel.png', // Reemplaza con tu imagen
            ),
            CategoryTile(
              title: 'fiction',
              imagePath: 'Images/fiction.png', // Reemplaza con tu imagen
            ),
            CategoryTile(
              title: 'childrens_books',
              imagePath: 'Images/children.png', // Reemplaza con tu imagen
            ),
            CategoryTile(
              title: 'educational',
              imagePath: 'Images/educational.png', // Reemplaza con tu imagen
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  //Cada una de las categorias a las que podemos acceder.
  final String title;
  final String imagePath;

  const CategoryTile({Key? key, required this.title, required this.imagePath})
      : super(key: key); //Constructor.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Para detectar los clicks
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryDetailsPage(category: title)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath), // Muestra la imagen
          ],
        ),
      ),
    );
  }
}
