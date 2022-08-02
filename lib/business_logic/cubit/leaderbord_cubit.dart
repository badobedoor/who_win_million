// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/getLeaderboard.dart';
import '../../data/repository/leaderbord_repository.dart';

part 'leaderbord_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  LeaderbordRepository leaderbordRepository;
  LeaderboardCubit(
    this.leaderbordRepository,
  ) : super(LeaderboardInitial());

  Future getLeaderboard() async {
    emit(LeaderbordLoding());
    leaderbordRepository.getLeaderboard().then((leaderboard) {
      if (leaderboard.isEmpty) {
        emit(GetLeaderbordErrorCase(
            errorMessage: 'الرجاء التاكد من اتصالك بالانترنت واعادة المحاوله'));
      } else {
        emit(LeaderboardLoaded(leaderboardData: leaderboard));
      }
    });
  }
}
