part of 'player_cubit.dart';

@immutable
abstract class PlayerState {}

class PlayerInitial extends PlayerState {}

//   Player Score  State
class PlayerScoreLoaded extends PlayerState {
  PlayerScore playerScoreData;
  PlayerScoreLoaded({
    required this.playerScoreData,
  });
}

class PlayerScoreLoding extends PlayerState {}

class GetPlayerScoreErrorCase extends PlayerState {
  final errorMessage;
  GetPlayerScoreErrorCase({this.errorMessage});
}
