import 'package:flutter/material.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String category;

  CategoryDetailsPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista simulada de libros para la categoría
    // En un caso real, estos datos vendrían de una base de datos
    final books = [
      Book(
          title: 'Libro 1',
          imagePath: 'assets/libro1.jpg',
          description: 'Descripción del Libro 1'),
      // Agrega más libros aquí
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          var book = books[index];
          return ListTile(
            leading: Image.asset(
                book.imagePath), // Cambiar a la ruta correcta de la imagen
            title: Text(book.title),
            onTap: () {
              // Aquí manejarías el toque en el libro para mostrar detalles
            },
          );
        },
      ),
    );
  }
}

// Clase para manejar la información de cada libro
class Book {
  final String title;
  final String imagePath;
  final String description;

  Book(
      {required this.title,
      required this.imagePath,
      required this.description});
}
