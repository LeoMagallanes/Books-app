import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Añadido const y key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Broker App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Books App'), // Text es const por defecto
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('Novel'), // Text es const por defecto
                onPressed: () {
                  // Acción para Divisas
                },
              ),
              ElevatedButton(
                child: Text('Fiction\'s'), // Text es const por defecto
                onPressed: () {
                  // Acción para ETF's
                },
              ),
              ElevatedButton(
                child: Text('Childrens Books'), // Text es const por defecto
                onPressed: () {
                  // Acción para Empresas de USA
                },
              ),
              ElevatedButton(
                child: Text('Educational'), // Text es const por defecto
                onPressed: () {
                  // Acción para Empresas Internacionales
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
