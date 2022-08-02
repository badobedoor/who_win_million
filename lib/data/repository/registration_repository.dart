import 'package:who_win_million/business_logic/cubit/registration_cubit.dart';

import '../models/loginPlayerAccount_by_ID.dart';
import '../models/newPlayer.dart';
import '../models/createNewPlayerWithAccount.dart';

import '../models/getPlayerNameByID.dart';

import '../models/updatePlayerName.dart';
import '../web_services/registration_web_services.dart';

class RegistrationRepository {
  RegistrationWebServices registrationWebServices;
  RegistrationRepository(this.registrationWebServices);

  //get
  Future<NewPlayer> createNewPlayer() async {
    final newPlayer = await registrationWebServices.createNewPlayer();
    if (newPlayer != {}) {
      var res = NewPlayer.fromJson(newPlayer);
      return res;
    } else {
      return NewPlayer();
    }

    // var res = newPlayer.map((player) => NewPlayer.fromJson(player));
  }

//post
  Future<NewPlayerWithAccount> createNewPlayerWithAccount({
    required String name,
    required String email,
    required String emailType,
  }) async {
    var formData = {
      'player_name': name,
      'player_email': email,
      'email_type': emailType,
    };
    final playerdata =
        await registrationWebServices.createNewPlayerWithAccount(formData);
    if (playerdata.isEmpty) {
      return NewPlayerWithAccount();
    }
    return NewPlayerWithAccount.fromJson(playerdata);
  }

  //get
  Future<GetPlayerNameByID> getPlayerNameByID({required int id}) async {
    // Map<String, dynamic>
    final player = await registrationWebServices.getPlayerNameByID(id: id);
    if (player != {}) {
      var res = GetPlayerNameByID.fromJson(player);
      return res;
    } else {
      return GetPlayerNameByID();
    }
  }

//post
  Future<UpdatePlayerNameData> updatePlayerName(
      {required var id, required String playerName}) async {
    final player = await registrationWebServices.updatePlayerName(
        id: id, playerName: playerName);
    if (player != {}) {
      var res = UpdatePlayerNameData.fromJson(player);
      return res;
    } else {
      return UpdatePlayerNameData();
    }
  }

// //get
//   Future<List<dynamic>> isRegistered({required var id}) async {
//     final isRegistered = await registrationWebServices.isRegistered(id: id);
//     return isRegistered
//         .map((registered) => IsRegistered.fromJson(registered))
//         .toList();
//   }

//post
  Future<LoginPlayerAccountByID> loginPlayerAccountByID(
      {required var id,
      required String email,
      required String emailType}) async {
    final playerData = await registrationWebServices.loginPlayerAccountByID(
        id: id, email: email, emailType: emailType);
    if (playerData.isEmpty) return LoginPlayerAccountByID();
    return LoginPlayerAccountByID.fromJson(playerData);
  }
}
