import 'package:flutter/material.dart';
import 'package:proyecto/DataBaseHelper.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String category;

  CategoryDetailsPage({Key? key, required this.category}) : super(key: key);

  Future<List<Book>> _fetchBooks() async {
    //Traer los libros de la base de datos
    final booksData = await DataBaseHelper.instance.getBooks(category);
    return booksData
        .map((book) => Book(
              title: book['name'],
              imagePath: book['cover_address'],
              description: book['description'],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: FutureBuilder<List<Book>>(
        // Carga asincrónica de los datos
        future: _fetchBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final books = snapshot.data ?? [];
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                var book = books[index];
                return ListTile(
                  leading: Image.asset(
                      book.imagePath), // Asegúrate de que la ruta es correcta
                  title: Text(book.title),
                  onTap: () {
                    // Aquí manejarías el toque en el libro para mostrar detalles
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
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

class BookFields {
  //Para llenar los datos de un libro con los de la base de datos.
  static final String id = '_id';
  static final String name = 'name';
  static final String description = 'description';
  static final String cover_address = 'cover_address';
}
