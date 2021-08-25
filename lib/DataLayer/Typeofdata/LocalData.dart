import 'package:study/domains/entities/UseCaseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData extends UserDataModel {
  String name, email, pass;
  LocalData({
    required this.name,
    required this.email,
    required this.pass,
  }) : super(username: name, usermail: email, userpassword: pass);

  /* static Future init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  }
*/
  void LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('username', name);
    await sharedPreferences.setString('useremail', email);
    await sharedPreferences.setString('userpassword', pass);
  }

  void SaveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String usename = (sharedPreferences.getString('username') ?? name);
    String useemail = (sharedPreferences.getString('useremail') ?? email);
    String usepassword = (sharedPreferences.getString('userpassword') ?? pass);
  }
}
