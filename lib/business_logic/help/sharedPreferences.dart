// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/player.dart';

class NewSharedPreferences with ChangeNotifier {
  static bool isOnboardingScreenShowed = false;
  static bool isLoginScreenShowed = false;
  static bool isSoundOn = true;
  static String? playerEmail;
  static String? emailType;
  static String? playerName;
  static int? playerId;

// Shared Preferences
  Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

//player

  //set player Data
  Future setPlayerData({
    String? newPlayerEmail,
    String? newEmailType,
    String? newPlayerName,
    int? newPlayerId,
  }) async {
    var prefs = await getInstance();

    //set player Email
    if (newPlayerEmail != null) {
      playerEmail = newPlayerEmail;
      prefs.setString('playerEmail', newPlayerEmail);
      PlayerAccount.playerEmail = playerEmail;
    }
    //set  Email type
    if (newEmailType != null) {
      emailType = newEmailType;
      prefs.setString('emailType', newEmailType);
      PlayerAccount.emailType = emailType;
    }
    //set player Name
    if (newPlayerName != null) {
      playerName = newPlayerName;
      prefs.setString('playerName', newPlayerName);
      PlayerAccount.playerName = playerName;
    }
    //set player ID
    if (newPlayerId != null) {
      playerId = newPlayerId;
      prefs.setInt('playerId', newPlayerId);
      PlayerAccount.playerId = playerId;
    }
    notifyListeners();
  }

  Future getPlayerData() async {
    var prefs = await getInstance();
    var _playerEmail = prefs.getString('playerEmail');
    var _emailType = prefs.getString('emailType');
    var _playerName = prefs.getString('playerName');
    var _playerId = prefs.getInt('playerId');

    //get player Email
    if (_playerEmail != null) {
      playerEmail = _playerEmail;
      PlayerAccount.playerEmail = playerEmail;
    }
    //get  Email type
    if (_emailType != null) {
      emailType = _emailType;
      PlayerAccount.emailType = emailType;
    }
    //get player Name
    if (_playerName != null) {
      playerName = _playerName;
      PlayerAccount.playerName = playerName;
    }
    //get player ID
    if (_playerId != null) {
      playerId = _playerId;
      PlayerAccount.playerId = playerId;
    }

    notifyListeners();
  }

  //clear player data
  Future clearPlayerData() async {
    var prefs = await getInstance();

    prefs.remove('playerEmail');
    prefs.remove('emailType');
    prefs.remove('playerName');
    prefs.remove('playerId');

    PlayerAccount.playerEmail = null;
    PlayerAccount.emailType = null;
    PlayerAccount.playerName = null;
    PlayerAccount.playerId = null;
    notifyListeners();
  }

//End player

  void setIsOnboardingScreenShowed(newIsOnboardingScreenShowed) async {
    isOnboardingScreenShowed = newIsOnboardingScreenShowed;

    var prefs = await getInstance();
    prefs.setBool('isOnboardingScreenShowed', newIsOnboardingScreenShowed);
    notifyListeners();
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

    var prefs = await getInstance();
    prefs.setBool('isOnboardingScreenShowed', newIsLoginScreenShowed);
    notifyListeners();
  }

  Future<bool> getIsLoginScreenShowed() async {
    var prefs = await getInstance();
    isLoginScreenShowed = prefs.getBool('isOnboardingScreenShowed') ?? false;
    notifyListeners();
    return isLoginScreenShowed;
  }

  Future setIsSoundOn(newIsSoundOn) async {
    isSoundOn = newIsSoundOn;

    var prefs = await getInstance();
    prefs.setBool('isSoundOn', newIsSoundOn);
    notifyListeners();
  }

  Future<bool> getIsSoundOn() async {
    var prefs = await getInstance();
    isSoundOn = prefs.getBool('isSoundOn') ?? true;
    notifyListeners();
    return isSoundOn;
  }
}
