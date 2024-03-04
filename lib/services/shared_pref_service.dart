import 'dart:convert';

import 'package:shared_pref/model/dress.dart';
import 'package:shared_pref/model/soccer.dart';
import 'package:shared_pref/services/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static Future<bool> storedObj(
      {required var obj, required String objKey}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringObj = jsonEncode(obj);
    return await prefs.setString(objKey, stringObj);
  }

  static Future getObj(var obj, String objKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? stringObj = prefs.getString(objKey);
    Map<String, dynamic> objMap = jsonDecode(stringObj!);

    /// Get object
    List list = [
      Dress.fromJson(objMap),
      SoccerPlayer.fromJson(objMap),
    ];
    // obj = list[0];
    // LoggerService.debugLogger(text: obj.toString());
    // return obj;
    if (obj ==Dress) {
      obj=list[0];
      LoggerService.debugLogger(text: "use");
      return obj;
    } else if (obj ==SoccerPlayer) {
      obj=list[1];
      return obj;
    }
  }
  static Future removeObj(String objKey) async {
    // Remove data for the 'counter' key.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(objKey);
  }
}
