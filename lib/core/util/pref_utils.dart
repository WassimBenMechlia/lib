import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

abstract class PrefUtils {
  String getToken();

  void setToken(String token);

  void removeToken();

  UserModel? getUser();

  void setUser(UserModel? user);

  void removeUser();

  String getSelectedLanguage();

  void setSelectedLanguage(String language);

  void removeSelectedLanguage();

  bool? getRememberMe();

  void setRememberMe(bool rememberMe);

  void removeRememberMe();

  bool getFirstTime();

  void setFirstTime(bool isFirstTime);

  void removeFirstTime();

  void logout();
}

class PrefUtilsImpl implements PrefUtils {
  final String userKey = "userData";
  final String rememberMeKey = "rememberMe";
  final String firstTimeKey = "firstTime";
  final String tokenKey = "token";
  final String selectedLanguageKey = "selectedLanguage";

  final SharedPreferences sharedPreferences;

  PrefUtilsImpl({required this.sharedPreferences});

  @override
  String getToken() {
    if (sharedPreferences.containsKey(tokenKey)) {
      return jsonDecode(sharedPreferences.getString(tokenKey) ?? "");
    } else {
      return '';
    }
  }

  @override
  void setToken(String token) {
    sharedPreferences.setString(tokenKey, jsonEncode(token));
  }

  @override
  void removeToken() {
    if (sharedPreferences.containsKey(tokenKey)) {
      sharedPreferences.remove(tokenKey);
    }
  }

  @override
  UserModel? getUser() {
    if (sharedPreferences.containsKey(userKey)) {
      return sharedPreferences.getString(userKey) != null
          ? UserModel.fromJson(
            jsonDecode(sharedPreferences.getString(userKey)!),
          )
          : null;
    } else {
      return null;
    }
  }

  @override
  void removeUser() {
    if (sharedPreferences.containsKey(userKey)) {
      sharedPreferences.remove(userKey);
    }
  }

  @override
  void setUser(UserModel? user) {
    sharedPreferences.setString(userKey, jsonEncode(user?.toJson()));
  }

  @override
  String getSelectedLanguage() {
    return sharedPreferences.getString(selectedLanguageKey) ??
        Platform.localeName.substring(0, 2);
  }

  @override
  void removeSelectedLanguage() {
    if (sharedPreferences.containsKey(selectedLanguageKey)) {
      sharedPreferences.remove(selectedLanguageKey);
    }
  }

  @override
  void setSelectedLanguage(String language) {
    sharedPreferences.setString(selectedLanguageKey, language);
  }

  @override
  bool getFirstTime() {
    if (sharedPreferences.containsKey(firstTimeKey)) {
      return sharedPreferences.getBool(firstTimeKey) == true;
    } else {
      return false;
    }
  }

  @override
  void setFirstTime(bool isFirstTime) {
    sharedPreferences.setBool(firstTimeKey, isFirstTime);
  }

  @override
  void removeFirstTime() {
    if (sharedPreferences.containsKey(firstTimeKey)) {
      sharedPreferences.remove(firstTimeKey);
    }
  }

  @override
  bool? getRememberMe() {
    if (sharedPreferences.containsKey(rememberMeKey)) {
      return sharedPreferences.getBool(rememberMeKey);
    } else {
      return false;
    }
  }

  @override
  void removeRememberMe() {
    if (sharedPreferences.containsKey(rememberMeKey)) {
      sharedPreferences.remove(rememberMeKey);
    }
  }

  @override
  void setRememberMe(bool rememberMe) {
    sharedPreferences.setBool(rememberMeKey, rememberMe);
  }

  @override
  void logout() {
    removeRememberMe();
    removeToken();
    removeUser();
  }
}
