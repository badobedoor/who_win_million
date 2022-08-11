import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/newPlayer.dart';
import '../../data/repository/registration_repository.dart';
import '../help/sharedPreferences.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationRepository registrationRepository;
  RegistrationCubit(this.registrationRepository) : super(RegistrationInitial());

  Future<bool> createNewPlayer() async {
    await NewSharedPreferences().clearPlayerData();
    emit(AddingNewPlayer());
    var newPlayer = await registrationRepository.createNewPlayer();

    // registrationRepository.createNewPlayer().then((newPlayer) {

    if (newPlayer.message == null) {
      emit(AddNewPlayerErrorCase(
          errorMessage: 'الرجاء التاكد من اتصالك بالانترنت واعادة المحاوله'));

      return false;
    } else if (newPlayer.success == true) {
      await NewSharedPreferences()
          .setPlayerData(newPlayerId: newPlayer.data!.id);
      emit(NewPlayerAdded());
      return true;
    } else {
      emit(AddNewPlayerErrorCase(errorMessage: newPlayer.message));
      return false;
    }
  }

  Future<bool> createNewPlayerWithAccount({
    required String name,
    required String email,
    required String emailType,
  }) async {
    emit(AddingNewPlayerWithAccount());
    var newPlayerWithAccount =
        await registrationRepository.createNewPlayerWithAccount(
            name: name, email: email, emailType: emailType);
    if (newPlayerWithAccount.message == null) {
      emit(AddNewPlayerErrorCase(
          errorMessage: 'الرجاء التاكد من اتصالك بالانترنت واعادة المحاوله'));
      return false;
    } else if (newPlayerWithAccount.success = true) {
      await NewSharedPreferences().setPlayerData(
        newPlayerEmail: newPlayerWithAccount.data!.playerAccount!.playerEmail,
        newPlayerName: newPlayerWithAccount.data!.playerName,
        newPlayerId: newPlayerWithAccount.data!.playerAccount!.playerId,
        newEmailType: newPlayerWithAccount.data!.playerAccount!.emailType,
      );

      emit(NewPlayerWithAccountAdded());
      return true;
    } else {
      emit(AddNewPlayerWithAccountErrorCase(
          errorMessage: newPlayerWithAccount.message));
      return false;
    }
  }

  Future getPlayerNameByID({required int id}) async {
    emit(PlayerNameLoding());
    registrationRepository.getPlayerNameByID(id: id).then((player) {
      if (player.success == true) {
        emit(PlayerNameLoaded(playerName: player.data!.playerName!));
        return;
      }
      if (player.success == false) {
        emit(PlayerNameErrorCase(errorMessage: player.message));
      } else {
        emit(PlayerNameErrorCase(
            errorMessage: 'الرجاء التاكد من اتصالك بالانترنت واعادة المحاوله'));
      }
    });
  }

  Future updatePlayerName({required int id, required String playerName}) async {
    emit(UpdatePlayerNameLoding());
    registrationRepository
        .updatePlayerName(id: id, playerName: playerName)
        .then((player) {
      if (player.success == true) {
        NewSharedPreferences()
            .setPlayerData(newPlayerName: player.data!.playerName!);
        emit(UpdatePlayerNameLoaded(playerName: player.data!.playerName!));
      } else {
        emit(UpdatePlayerNameErrorCase(errorMessage: player.message));
      }

      // else {
      //   var t = playerScore;
      //   emit(GetPlayerScoreErrorCase(
      //       errorMessage: 'الرجاء التاكد من اتصالك بالانترنت واعادة المحاوله'));
      // }
    });
  }

  Future<bool> loginPlayerAccountByID({
    required String name,
    required int id,
    required String email,
    required String emailType,
  }) async {
    emit(LoginPlayerAccountByIdLoding());
    var newPlayerWithAccount =
        await registrationRepository.loginPlayerAccountByID(
            id: id, email: email, emailType: emailType, name: name);
    if (newPlayerWithAccount.message == null) {
      emit(LoginPlayerAccountByIdErrorCase(
          errorMessage: 'الرجاء التاكد من اتصالك بالانترنت واعادة المحاوله'));
      return false;
    } else if (newPlayerWithAccount.success = true) {
      await NewSharedPreferences().setPlayerData(
        newPlayerEmail: newPlayerWithAccount.data!.playerAccount!.playerEmail,
        newPlayerName: newPlayerWithAccount.data!.playerName,
        newPlayerId:
            int.parse('${newPlayerWithAccount.data!.playerAccount!.playerId}'),
        newEmailType: newPlayerWithAccount.data!.playerAccount!.emailType,
      );
      emit(LoginPlayerAccountByIdLoded());
      return true;
    } else {
      emit(LoginPlayerAccountByIdErrorCase(
          errorMessage: newPlayerWithAccount.message));
      return false;
    }
  }
}
