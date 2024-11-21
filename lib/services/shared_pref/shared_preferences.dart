import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  factory SharedPref() {
    return preferences;
  }

  SharedPref._internal();
  static final SharedPref preferences = SharedPref._internal();

  static late SharedPreferences sharedPreferences;

  /// دالة تهيئة Shared Preferences
  Future<dynamic> instantiatePreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// إضافة قيمة نصية
  Future<dynamic> setString(String key, String stringValue) async {
    await sharedPreferences.setString(key, stringValue);
  }

  /// استرجاع قيمة نصية
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  /// إضافة قيمة منطقية
  Future<dynamic> setBoolean(String key, bool booleanValue) async {
    await sharedPreferences.setBool(key, booleanValue);
  }

  /// استرجاع قيمة منطقية
  bool? getBoolean(String key) {
    return sharedPreferences.getBool(key);
  }

  /// إضافة قيمة عشرية
  Future<dynamic> setDouble(String key, double doubleValue) async {
    await sharedPreferences.setDouble(key, doubleValue);
  }

  /// استرجاع قيمة عشرية
  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  /// إضافة قيمة عدد صحيح
  Future<dynamic> setInt(String key, int intValue) async {
    await sharedPreferences.setInt(key, intValue);
  }

  /// استرجاع قيمة عدد صحيح
  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  /// حذف تفضيل محدد
  Future<dynamic> removePreference(String key) async {
    await sharedPreferences.remove(key);
  }

  /// التحقق من وجود تفضيل محدد
  bool containPreference(String key) {
    if (sharedPreferences.get(key) == null) {
      return false;
    } else {
      return true;
    }
  }

  /// مسح جميع التفضيلات
  Future<dynamic> clearPreferences() async {
    await sharedPreferences.clear();
  }
}
