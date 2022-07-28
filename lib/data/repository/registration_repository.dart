import '../models/newPlayer.dart';
import '../models/createNewPlayerWithAccount.dart';
import '../models/createPlayerAccount_by_ID.dart';
import '../models/getPlayerNameByID.dart';
import '../models/isRegistered.dart';
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
  Future<List<dynamic>> getPlayerNameByID({required var id}) async {
    final playerNames = await registrationWebServices.getPlayerNameByID(id: id);
    return playerNames
        .map((playerName) => GetPlayerNameByID.fromJson(playerName))
        .toList();
  }

//post
  Future<List<dynamic>> updatePlayerName(
      {required var id, required String playerName}) async {
    final playername = await registrationWebServices.updatePlayerName(
        id: id, playerName: playerName);
    return playername
        .map((player) => UpdatePlayerName.fromJson(player))
        .toList();
  }

//get
  Future<List<dynamic>> isRegistered({required var id}) async {
    final isRegistered = await registrationWebServices.isRegistered(id: id);
    return isRegistered
        .map((registered) => IsRegistered.fromJson(registered))
        .toList();
  }

//post
  Future<List<dynamic>> createPlayerAccount(
      {required var id,
      required String email,
      required String emailType}) async {
    final playerData = await registrationWebServices.createPlayerAccount(
        id: id, email: email, emailType: emailType);
    return playerData
        .map((player) => CreatePlayerAccount_by_ID.fromJson(player))
        .toList();
  }
}
