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

//************** */
class PlayerNameByID extends RegistrationState {}

class UpdatePlayerName extends RegistrationState {}

class CreatePlayerAccount extends RegistrationState {}

class IsRegistered extends RegistrationState {}
