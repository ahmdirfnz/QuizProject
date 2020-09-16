import 'package:path/path.dart';
import 'package:quiz_math_project/model/login_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String TABLE_LOGIN = "login";
  static const String TABLE_ID = "id";
  static const String TABLE_USERNAME = "username";
  static const String TABLE_PASSWORD = "password";

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print("database getter called");

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'usernameDB.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        print("Creating food table");

        await database.execute(
          "CREATE TABLE $TABLE_LOGIN("
          "$TABLE_USERNAME TEXT,"
          "$TABLE_PASSWORD TEXT)",
        );
      },
    );
  }

  Future<List<LoginData>> getLoginData() async {
    final db = await database;

    var loginData =
        await db.query(TABLE_LOGIN, columns: [TABLE_USERNAME, TABLE_PASSWORD]);

    List<LoginData> loginList = List<LoginData>();

    loginData.forEach((currentLogin) {
      LoginData loginData = LoginData.fromMap(currentLogin);
      loginList.add(loginData);
    });
    return loginList;
  }

  Future<LoginData> insert(LoginData loginData) async {
    final db = await database;
    // loginData.username = await db.insert(TABLE_LOGIN, loginData.toMap());
    return loginData;
  }
}
