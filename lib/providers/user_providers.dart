import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/model/user.dart';
import 'package:instagram_clone/resources/auth_method.dart';

class UserProvider with ChangeNotifier, AuthMethods {
  User? _user;

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await getUserDetails();
    _user = user;
    notifyListeners();
  }
}
