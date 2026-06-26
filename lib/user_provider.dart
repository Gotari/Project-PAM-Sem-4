import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String _namaUser = "Bryan Lauda";
  bool _isLogin = false;

  String get namaUser => _namaUser;
  bool get isLogin => _isLogin;

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    _namaUser = prefs.getString("namaUser") ?? "Bryan Lauda";
    _isLogin = prefs.getBool("isLogin") ?? false;
    notifyListeners();
  }

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    _isLogin = true;
    await prefs.setBool("isLogin", true);
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    _isLogin = false;
    await prefs.setBool("isLogin", false);
    notifyListeners();
  }

  Future<void> updateNama(String namaBaru) async {
    final prefs = await SharedPreferences.getInstance();
    _namaUser = namaBaru;
    await prefs.setString("namaUser", namaBaru);
    notifyListeners();
  }
}