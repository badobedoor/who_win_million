// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'leaderbord_cubit.dart';

@immutable
abstract class LeaderboardState {}

class LeaderboardInitial extends LeaderboardState {}

// Leaderboard States
class LeaderboardLoaded extends LeaderboardState {
  final List<LeaderboardData> leaderboardData;

  LeaderboardLoaded({required this.leaderboardData});
}

class LeaderbordLoding extends LeaderboardState {}

class GetLeaderbordErrorCase extends LeaderboardState {
  final errorMessage;
  GetLeaderbordErrorCase({this.errorMessage});
}

// //   Player Score  State
// class PlayerScoreLoaded extends LeaderboardState {
//   int playerScoreData;
//   PlayerScoreLoaded({
//     required this.playerScoreData,
//   });
// }

// class PlayerScoreLoding extends LeaderboardState {}

// class GetPlayerScoreErrorCase extends LeaderboardState {
//   final errorMessage;
//   GetPlayerScoreErrorCase({this.errorMessage});
// }
