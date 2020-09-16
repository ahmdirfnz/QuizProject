import 'package:quiz_math_project/db/dbHolder.dart';

class LoginData {
  String username;
  String password;

  LoginData({this.username, this.password});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.TABLE_USERNAME: username,
      DatabaseProvider.TABLE_PASSWORD: password,
    };

    if (username != null) {
      map[DatabaseProvider.TABLE_USERNAME] = username;
    }
    return map;
  }

  LoginData.fromMap(Map<String, dynamic> map) {
    username = map[DatabaseProvider.TABLE_USERNAME];
    password = map[DatabaseProvider.TABLE_PASSWORD];
  }
}
