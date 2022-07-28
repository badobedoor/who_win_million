import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/newPlayer.dart';
import '../../data/repository/registration_repository.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationRepository registrationRepository;
  RegistrationCubit(this.registrationRepository) : super(RegistrationInitial());

  Future<bool> createNewPlayer() async {
    emit(AddingNewPlayer());
    var newPlayer = await registrationRepository.createNewPlayer();

    // registrationRepository.createNewPlayer().then((newPlayer) {

    if (newPlayer.message == null) {
      emit(AddNewPlayerErrorCase(
          errorMessage: 'الرجاء التاكد من اتصالك بالانترنت واعادة المحاوله'));

      return false;
    } else if (newPlayer.success == true) {
      //added
      //الاحتفاظ بالid
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
      //اضافه اليوزر فى مكان داخلى
      //added
      //الاحتفاظ بالid
      emit(NewPlayerWithAccountAdded());
      return true;
    } else {
      emit(AddNewPlayerWithAccountErrorCase(
          errorMessage: newPlayerWithAccount.message));
      return false;
    }
  }
}
