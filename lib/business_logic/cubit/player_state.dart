part of 'player_cubit.dart';

@immutable
abstract class PlayerState {}

class PlayerInitial extends PlayerState {}

class SS extends PlayerState {
  SS({required this.show});

  final bool show;
}

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
