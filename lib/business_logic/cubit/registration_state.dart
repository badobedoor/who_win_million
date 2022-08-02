// ignore_for_file: prefer_typing_uninitialized_variables

part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

//  New Player State
class NewPlayerAdded extends RegistrationState {}

class AddingNewPlayer extends RegistrationState {}

class AddNewPlayerErrorCase extends RegistrationState {
  final errorMessage;
  AddNewPlayerErrorCase({this.errorMessage});
}

//  New Player With Account State
class NewPlayerWithAccountAdded extends RegistrationState {}

class AddingNewPlayerWithAccount extends RegistrationState {}

class AddNewPlayerWithAccountErrorCase extends RegistrationState {
  final errorMessage;
  AddNewPlayerWithAccountErrorCase({this.errorMessage});
}

//   Player Name State
class PlayerNameLoaded extends RegistrationState {
  String playerName;
  PlayerNameLoaded({
    required this.playerName,
  });
}

class PlayerNameLoding extends RegistrationState {}

class PlayerNameErrorCase extends RegistrationState {
  final errorMessage;
  PlayerNameErrorCase({this.errorMessage});
}

//   Update Player Name State
class UpdatePlayerNameLoaded extends RegistrationState {
  String playerName;
  UpdatePlayerNameLoaded({
    required this.playerName,
  });
}

class UpdatePlayerNameLoding extends RegistrationState {}

class UpdatePlayerNameErrorCase extends RegistrationState {
  final errorMessage;
  UpdatePlayerNameErrorCase({this.errorMessage});
}

// login Acont with player id
class LoginPlayerAccountByIdLoded extends RegistrationState {}

class LoginPlayerAccountByIdLoding extends RegistrationState {}

class LoginPlayerAccountByIdErrorCase extends RegistrationState {
  final errorMessage;
  LoginPlayerAccountByIdErrorCase({this.errorMessage});
}

//************* */
class IsRegistered extends RegistrationState {}
