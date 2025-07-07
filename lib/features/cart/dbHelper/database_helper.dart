import 'package:ecommerce_app/features/cart/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal(); //
  factory DatabaseHelper() => _instance; // Singleton pattern to ensure only one instance of DatabaseHelper exists
  static Database? _database; // Private variable to hold the database instance
  DatabaseHelper._internal(); // Private constructor for the singleton pattern

  Future<Database> get database async {
    if (_database != null) return _database!; // Return the existing database if it has already been created
    _database = await _initDatabase(); // Initialize the database if it hasn't been created yet
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cart.db');  // Define the path for the database file
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart(
        id INTEGER PRIMARY KEY,
        name TEXT,
        image TEXT,
        sizeId INTEGER,
        colorId INTEGER,
        quantity INTEGER,
        price REAL 
      )
    ''');
  }

  Future<void> insertCartItem(CartItem item) async {
    final db = await database;
    await db.insert('cart', item.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    print('Item inserted into cart: ${item.name}');
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cart');

    return List.generate(maps.length, (i) {
      return CartItem(
        id: maps[i]['id'],
        name: maps[i]['name'],
        image: maps[i]['image'],
        sizeId: maps[i]['sizeId'],
        colorId: maps[i]['colorId'],
        quantity: maps[i]['quantity'],
        price: maps[i]['price'],
      );
    });
  }


  Future<int> getCartItemsCount() async {
    final db = await database;
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM cart'),
    );
    return count ?? 0;
  }



  Future<void> updateCartItem(CartItem item) async {
    final db = await database;
    await db.update('cart', item.toMap(), where: 'id = ?', whereArgs: [item.id]);
  }




  Future<void> deleteCartItem(int id) async {
    final db = await database;
    await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }




  Future<void> deleteAllCartItems() async {
    final db = await database;
    await db.delete('cart'); // No where clause deletes all rows
    print('All cart items deleted');
  }

}