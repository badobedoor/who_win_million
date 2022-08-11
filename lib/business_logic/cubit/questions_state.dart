part of 'questions_cubit.dart';

@immutable
abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoded extends QuestionsState {
  final QuestionsData questions;

  QuestionsLoded(this.questions);
}

class QuestionsLoding extends QuestionsState {}

class QuestionsErrorCase extends QuestionsState {
  final errorMessage;
  QuestionsErrorCase({this.errorMessage});
}

//IncreaseScorebyID
class IncreaseScorebyIDLoaded extends QuestionsState {}

class IncreaseScorebyIDLoding extends QuestionsState {}

class IncreaseScorebyIDErrorCase extends QuestionsState {
  final errorMessage;
  IncreaseScorebyIDErrorCase({this.errorMessage});
}
