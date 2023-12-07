import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto/CategoryDetailsPage.dart';

final List<String> tableNames = [
  "novel",
  "fiction",
  "educational",
  "childrens_books"
];

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._init();

  static Database? _database;

  DataBaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!; //Retornamos la base si no existe.

    _database = await _initDB('mobileApp.db'); //La creamos
    return _database!;
  }

  Future _insertData(Database db) async {
    // Insertar datos en la tabla novel
    final novels = [
      {
        'id': 1,
        'name': 'Whispers of the Past',
        'cover_address': 'Images/bookImgs/Novels1.jpeg',
        'description':
            'A historical novel exploring the secrets of a forgotten era.'
      },
      {
        'id': 2,
        'name': 'The Last Painter',
        'cover_address': 'Images/bookImgs/Novels2.jpeg',
        'description':
            "The story of an artist's passion and struggle in a changing world."
      },
      {
        'id': 3,
        'name': 'Crossroads',
        'cover_address': 'Images/bookImgs/Novels3.jpeg',
        'description':
            'A powerful narrative about the choices and paths in life.'
      },
      {
        'id': 4,
        'name': 'Echoes in the Valley',
        'cover_address': 'Images/bookImgs/Novels4.jpeg',
        'description': 'A gripping tale set in a small town with deep secrets.'
      },
      {
        'id': 5,
        'name': 'The Glass Horizon',
        'cover_address': 'Images/bookImgs/Novels5.jpeg',
        'description': 'A journey of self-discovery and transformation.'
      },
      {
        'id': 6,
        'name': 'Shadow Dance',
        'cover_address': 'Images/bookImgs/Novels6.jpeg',
        'description': 'A suspenseful story of mystery and intrigue.'
      },
      {
        'id': 7,
        'name': "Winter's Embrace",
        'cover_address': 'Images/bookImgs/Novels7.jpeg',
        'description':
            'A touching story set against the backdrop of a harsh winter.'
      },
      {
        'id': 8,
        'name': 'Beyond the Stars',
        'cover_address': 'Images/bookImgs/Novels8.jpeg',
        'description': 'A love story that transcends time and space.'
      },
      {
        'id': 9,
        'name': 'City of Dreams',
        'cover_address': 'Images/bookImgs/Novels9.jpeg',
        'description':
            'A novel about ambition, love, and the allure of a big city.'
      },
      {
        'id': 10,
        'name': 'The Silent River',
        'cover_address': 'Images/bookImgs/Novels10.jpeg',
        'description':
            'A compelling narrative about the mysteries of a quiet river town.'
      }
    ];

    final fictions = [
      {
        'id': 1,
        'name': 'The Forgotten City',
        'cover_address': 'Images/bookImgs/Fiction1.jpeg',
        'description': 'A thrilling mystery set in a city that time forgot.',
      },
      {
        'id': 2,
        'name': 'Galactic War',
        'cover_address': 'Images/bookImgs/Fiction2.jpeg',
        'description':
            'An epic space opera about interstellar conflict and heroism.',
      },
      {
        'id': 3,
        'name': 'The Shadow Thief',
        'cover_address': 'Images/bookImgs/Fiction3.jpeg',
        'description':
            'A tale of intrigue and suspense following a master thief.',
      },
      {
        'id': 4,
        'name': 'Parallel Worlds',
        'cover_address': 'Images/bookImgs/Fiction4.jpeg',
        'description': 'A sci-fi adventure through alternate realities.',
      },
      {
        'id': 5,
        'name': 'The Last Wizard',
        'cover_address': 'Images/bookImgs/Fiction5.jpeg',
        'description':
            'A fantasy story about the last wizard fighting against dark forces.',
      },
      {
        'id': 6,
        'name': 'Haunted Mansion',
        'cover_address': 'Images/bookImgs/Fiction6.jpeg',
        'description':
            'A spooky and thrilling story set in an old, haunted mansion.',
      },
      {
        'id': 7,
        'name': 'Time Traveler',
        'cover_address': 'Images/bookImgs/Fiction7.jpeg',
        'description':
            'A journey through different time periods in search of a lost secret.',
      },
      {
        'id': 8,
        'name': 'Desert Mirage',
        'cover_address': 'Images/bookImgs/Fiction8.jpeg',
        'description':
            'A gripping survival story in a vast, unforgiving desert.',
      },
      {
        'id': 9,
        'name': 'The Lost Expedition',
        'cover_address': 'Images/bookImgs/Fiction9.jpeg',
        'description':
            'The perilous adventure of an expedition gone missing in the jungle.',
      },
      {
        'id': 10,
        'name': 'Island of Dreams',
        'cover_address': 'Images/bookImgs/Fiction10.jpeg',
        'description':
            'A magical tale set on a mysterious and enchanted island.',
      },
    ];

    final educationals = [
      {
        'id': 1,
        'name': 'Math Fundamentals',
        'cover_address': 'Images/bookImgs/Educational1.jpeg',
        'description':
            'An introduction to basic math concepts for young learners.',
      },
      {
        'id': 2,
        'name': 'World History',
        'cover_address': 'Images/bookImgs/Educational2.jpeg',
        'description':
            'A journey through the major events and eras of world history.',
      },
      {
        'id': 3,
        'name': 'Science Experiments',
        'cover_address': 'Images/bookImgs/Educational3.jpeg',
        'description': 'Exciting and engaging science experiments for kids.',
      },
      {
        'id': 4,
        'name': 'Geography Explorer',
        'cover_address': 'Images/bookImgs/Educational4.jpeg',
        'description':
            'Learn about different countries, cultures, and landscapes.',
      },
      {
        'id': 5,
        'name': 'Language Skills',
        'cover_address': 'Images/bookImgs/Educational5.jpeg',
        'description':
            'Developing language and grammar skills for young readers.',
      },
      {
        'id': 6,
        'name': 'Astronomy 101',
        'cover_address': 'Images/bookImgs/Educational6.jpeg',
        'description':
            'An exploration of the universe and its celestial bodies.',
      },
      {
        'id': 7,
        'name': 'Ecology for Kids',
        'cover_address': 'Images/bookImgs/Educational7.jpeg',
        'description': 'Understanding ecosystems and the environment.',
      },
      {
        'id': 8,
        'name': 'Computer Basics',
        'cover_address': 'Images/bookImgs/Educational8.jpeg',
        'description': 'An introduction to computers and basic programming.',
      },
      {
        'id': 9,
        'name': 'Art and Craft',
        'cover_address': 'Images/bookImgs/Educational9.jpeg',
        'description':
            'Encouraging creativity through various art and craft techniques.',
      },
      {
        'id': 10,
        'name': 'Music and Rhythm',
        'cover_address': 'Images/bookImgs/Educational10.jpeg',
        'description': 'Discovering the world of music and its fundamentals.',
      },
    ];

    final childrens_bookss = [
      {
        'id': 1,
        'name': 'The Magic Forest',
        'cover_address': 'Images/bookImgs/Childrens1.jpeg',
        'description':
            'A whimsical adventure through a forest filled with magical creatures.'
      },
      {
        'id': 2,
        'name': 'Space Explorers',
        'cover_address': 'Images/bookImgs/Childrens2.jpeg',
        'description':
            'Join a group of young astronauts as they explore the wonders of space.'
      },
      {
        'id': 3,
        'name': 'Underwater World',
        'cover_address': 'Images/bookImgs/Childrens3.jpeg',
        'description':
            'Discover the mysteries of the ocean and the creatures that inhabit it.'
      },
      {
        'id': 4,
        'name': 'The Lost Dinosaur',
        'cover_address': 'Images/bookImgs/Childrens4.jpeg',
        'description':
            'Follow the journey of a young dinosaur trying to find its way home.'
      },
      {
        'id': 5,
        'name': 'The Little Artist',
        'cover_address': 'Images/bookImgs/Childrens5.jpeg',
        'description':
            'A story about creativity and imagination in the world of art.'
      },
      {
        'id': 6,
        'name': 'The Giant Peach',
        'cover_address': 'Images/bookImgs/Childrens6.jpeg',
        'description':
            'A tale of a magical peach and the fantastical journey it brings.'
      },
      {
        'id': 7,
        'name': 'Robot Friends',
        'cover_address': 'Images/bookImgs/Childrens7.jpeg',
        'description':
            'A heartwarming story about a child and their robot companion.'
      },
      {
        'id': 8,
        'name': 'The Hidden Garden',
        'cover_address': 'Images/bookImgs/Childrens8.jpeg',
        'description':
            'Uncover the secrets of a hidden garden in this enchanting story.'
      },
      {
        'id': 9,
        'name': 'The Flying Bike',
        'cover_address': 'Images/bookImgs/Childrens9.jpeg',
        'description':
            'Experience the adventure of a flying bike that takes a child to incredible places.'
      },
      {
        'id': 10,
        'name': 'Pirate Adventures',
        'cover_address': 'Images/bookImgs/Childrens10.jpeg',
        'description':
            'Join a crew of young pirates as they embark on exciting adventures.'
      }
    ];

    for (var novel in novels) {
      await db.insert('novel', {
        'id': novel['id'],
        'name': novel['name'],
        'cover_address': novel['cover_address'],
        'description': novel['description'],
      });
    }

    for (var fiction in fictions) {
      await db.insert('fiction', {
        'id': fiction['id'],
        'name': fiction['name'],
        'cover_address': fiction['cover_address'],
        'description': fiction['description'],
      });
    }

    for (var educational in educationals) {
      await db.insert('fiction', {
        'id': educational['id'],
        'name': educational['name'],
        'cover_address': educational['cover_address'],
        'description': educational['description'],
      });
    }

    for (var childrens_books in childrens_bookss) {
      await db.insert('fiction', {
        'id': childrens_books['id'],
        'name': childrens_books['name'],
        'cover_address': childrens_books['cover_address'],
        'description': childrens_books['description'],
      });
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    final nameType = "varchar(50) NOT NULL";
    final descriptionType = "varchar(300) NOT NULL";
    final cover_addressType = "varchar(50) NOT NULL";

    await db.execute('''
      CREATE TABLE $tableNames[0] (
      ${BookFields.id} $idType,
      ${BookFields.name} $nameType,
      ${BookFields.description} $descriptionType,
      ${BookFields.cover_address} $cover_addressType,
      );

      CREATE TABLE $tableNames[1] (
      ${BookFields.id} $idType,
      ${BookFields.name} $nameType,
      ${BookFields.description} $descriptionType,
      ${BookFields.cover_address} $cover_addressType,
      );

      CREATE TABLE $tableNames[2] (
      ${BookFields.id} $idType,
      ${BookFields.name} $nameType,
      ${BookFields.description} $descriptionType,
      ${BookFields.cover_address} $cover_addressType,
      );

      CREATE TABLE $tableNames[3] (
      ${BookFields.id} $idType,
      ${BookFields.name} $nameType,
      ${BookFields.description} $descriptionType,
      ${BookFields.cover_address} $cover_addressType,
      );
    ''');
  }

  Future<List<Map<String, dynamic>>> getBooks(String category) async {
    final db = await database;
    return await db.query(category);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
