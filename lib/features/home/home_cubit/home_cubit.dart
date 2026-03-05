import 'package:bloc/bloc.dart';
import 'package:depi/features/home/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Products> productsList = [];
  ProductModel? productModel;
  late Database database;

  void loadProducts() async {
    emit(HomeLoading());
    try {
      await openDb();
      await Future.delayed(const Duration(seconds: 3));

      final response = await database.rawQuery('SELECT * FROM Products');
      Map<String, dynamic> fakeJson = {'products': response};
      productModel = ProductModel.fromJson(fakeJson);
      productsList = productModel?.products ?? [];

      emit(HomeLoaded());
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  openDb() async {
    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/demo.db';

    database = await openDatabase(
      path,
      version: 5,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Products (id INTEGER PRIMARY KEY, name TEXT, description TEXT, price INTEGER, rating REAL, category TEXT, ratingsCount INTEGER, image TEXT)',
        );
        await _insertInitialData(db);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        await db.execute('DROP TABLE IF EXISTS Products');
        await db.execute(
          'CREATE TABLE Products (id INTEGER PRIMARY KEY, name TEXT, description TEXT, price INTEGER, rating REAL, category TEXT, ratingsCount INTEGER, image TEXT)',
        );
        await _insertInitialData(db);
      },
    );
  }

  Future<void> _insertInitialData(Database db) async {
    var batch = db.batch();
    batch.rawInsert(
      'INSERT INTO Products(id,name, description, price, rating, category, ratingsCount, image) VALUES(?, ?, ?, ?, ?, ?, ?, ?)',
      [
        1,
        "برغر",
        "برغر مشوي طازج مع الخس والطماطم والجبن",
        200,
        4.5,
        "وجبات سريعة",
        1150,
        "assets/images/burger.png",
      ],
    );
    batch.rawInsert(
      'INSERT INTO Products(id,name, description, price, rating, category, ratingsCount, image) VALUES(?, ?, ?, ?, ?, ?, ?, ?)',
      [
        2,
        "دجاج",
        "دجاج مشوي طري مع الأعشاب والتوابل",
        350,
        4.0,
        "مشويات",
        850,
        "assets/images/chicken.png",
      ],
    );
    batch.rawInsert(
      'INSERT INTO Products(id,name, description, price, rating, category, ratingsCount, image) VALUES(?, ?, ?, ?, ?, ?, ?, ?)',
      [
        3,
        "لحم",
        "لحم مشوي طازج مع الأعشاب والتوابل",
        400,
        4.2,
        "ستيك",
        750,
        "assets/images/meat.png",
      ],
    );
    batch.rawInsert(
      'INSERT INTO Products(id,name, description, price, rating, category, ratingsCount, image) VALUES(?, ?, ?, ?, ?, ?, ?, ?)',
      [
        4,
        "مأكولات بحرية",
        "طبق بحري فاخر مع الروبيان والكركند والسمك الطازج",
        500,
        4.8,
        "بحري",
        1200,
        "assets/images/seafood.png",
      ],
    );

    await batch.commit();
  }
}
