import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSaver {
  static String isRunAppFirstTimeKey = "ISRUNAPPFIRSTTIMEKEY";
  static bool isRunAppFirstTime = true;
  static String emailKey = "EMAILKEY";
  static String nameKey = "NAMEKEY";
  static String userDocKey = "USERDOCKEY";

 static String name = "";
 static String email = "";
 static String userDoc = "";
  static setIsRunAppFirstTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(isRunAppFirstTimeKey, false);
  }

  static Future<bool?> getIsRunAppFirstTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(isRunAppFirstTimeKey);
  }

  // #############
  static setEmail(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(emailKey, email);
  }

  static Future<String?> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(emailKey);
  }
// ####################

  static setName(String nam) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(nameKey, nam);
  }

  static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameKey);
  }

// ####################
  static setUserId(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(userDocKey, id);
  }

  static Future<String?> getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userDocKey);
  }
// ####################
}
