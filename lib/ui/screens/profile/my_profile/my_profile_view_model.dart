import 'package:get/get.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/response/base_response.dart';
import 'package:pickmed/core/model/response/user_profile_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/auth_serives.dart';
import 'package:pickmed/core/services/data_base_services.dart';
import 'package:pickmed/core/services/local_storage.dart';
import 'package:pickmed/locator.dart';

class MyProfileViewModel extends BaseViewModel {
  final authService = locator<AuthServices>();
  final _dbService = DatabaseService();
  final _localStorateService = locator<LocalStorageService>();

  updateUserProfile() async {
    setState(ViewState.busy);
    ApiBaseResponse userProfileResponse = await _dbService.updateUser(
        _localStorateService.getUserid, authService.userProfile);
    if (userProfileResponse.success == true) {
      Get.snackbar("Success!", "Profile Successfully updated");
    }
    setState(ViewState.idle);
  }
}
