import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {isLogin,email ,password}

class SharedPrefController {
  // Obtain shared preferences.
   late SharedPreferences prefs ;
   static SharedPrefController? _instance;


   SharedPrefController._();

   factory SharedPrefController(){
     return _instance ??= SharedPrefController._();
   }


   getInit()  async {
    prefs =  await SharedPreferences.getInstance();
  }


   Future<bool> setData({key, value}) async {
     if(value is int){
       return await prefs.setInt(key, value);
     } else if(value is double){
       return await prefs.setDouble(key, value);
     } else if(value is String){
       return await prefs.setString(key, value);
     }else {
       return await prefs.setBool(key, value);
     }
  }

  saveUser({user}){
setData(key: 'name', value: user.name);
setData(key: 'email', value: user.email);
setData(key: 'password', value: user.password);
  }
  // Future<bool> setInt({key, value}) async {
  //   return await prefs.setInt(key, value);
  // }

   // Future<bool> setDouble({key, value}) async {
   //   return await prefs.setDouble(key, value);
   // }
   // Future<bool> setString({key, value}) async {
   //   return await prefs.setString(key, value);
   // }
   // Future<bool> setBool({key, value}) async {
   //   return await prefs.setBool(key, value);
   // }

   // int getInt({key}){
   //   return prefs.getInt(key)??0;
   // }
   //
   // double getDouble({key}){
   //   return prefs.getDouble(key)??0.0;
   // }
   //
   // String getString({key}){
   //   return prefs.getString(key)??'';
   // }
   //
   // bool getBool({key}){
   //   return prefs.getBool(key)??false;
   // }

   T? getData<T>({key}){
     return prefs.get(key) as T?;
   }

   Future<bool> clear() async {
     return await prefs.clear();
   }

   Future<bool> remove({key}) async {
     return await prefs.remove(key);
   }
}
