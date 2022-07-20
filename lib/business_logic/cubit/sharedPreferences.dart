import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewSharedPreferences with ChangeNotifier {
  bool isOnboardingScreenShowed = false;
  bool isLoginScreenShowed = false;

  Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  void setIsOnboardingScreenShowed(newIsOnboardingScreenShowed) async {
    isOnboardingScreenShowed = newIsOnboardingScreenShowed;
    notifyListeners();
    var prefs = await getInstance();
    prefs.setBool('isOnboardingScreenShowed', newIsOnboardingScreenShowed);
  }

  Future<bool> getIsOnboardingScreenShowed() async {
    var prefs = await getInstance();
    isOnboardingScreenShowed =
        prefs.getBool('isOnboardingScreenShowed') ?? false;
    notifyListeners();
    return isOnboardingScreenShowed;
  }

  void setIsLoginScreenShowed(newIsLoginScreenShowed) async {
    isLoginScreenShowed = newIsLoginScreenShowed;
    notifyListeners();
    var prefs = await getInstance();
    prefs.setBool('isOnboardingScreenShowed', newIsLoginScreenShowed);
  }

  Future<bool> getIsLoginScreenShowed() async {
    var prefs = await getInstance();
    isLoginScreenShowed = prefs.getBool('isOnboardingScreenShowed') ?? false;
    notifyListeners();
    return isLoginScreenShowed;
  }
}
