// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/getPlayerScore.dart';
import '../../data/repository/leaderbord_repository.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  LeaderbordRepository leaderbordRepository;
  PlayerCubit(
    this.leaderbordRepository,
  ) : super(PlayerInitial());

  //data
  bool show = false;

  Future getPlayerScoreByID({required int id}) async {
    emit(PlayerScoreLoding());
    leaderbordRepository.getPlayerScoreByID(id: id).then((playerScore) {
      if (playerScore.success == true) {
        emit(PlayerScoreLoaded(playerScoreData: playerScore));
      } else {
        emit(GetPlayerScoreErrorCase(errorMessage: playerScore.message));
      }
      // else {
      //   var t = playerScore;
      //   emit(GetPlayerScoreErrorCase(
      //       errorMessage: 'الرجاء التاكد من اتصالك بالانترنت واعادة المحاوله'));
      // }
    });
  }
}
