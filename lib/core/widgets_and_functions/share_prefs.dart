
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsLocal{
  static late SharedPreferences prefs;
  static init()async{
    prefs=await SharedPreferences.getInstance();
  }

 static saveData({required String key , required dynamic value})async{
    if(value is String){
     return await prefs.setString(key, value);
    }else if(value is bool){
      return await prefs.setBool(key, value);
    }else if(value is double){
      return await prefs.setDouble(key, value);
    }else if(value is int){
      return  await prefs.setInt(key, value);

    }
  }

  static Object? getData({required String key}){
 return prefs.get(key);
  }
}