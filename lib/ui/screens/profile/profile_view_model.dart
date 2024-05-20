import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/auth_serives.dart';
import 'package:pickmed/locator.dart';

class ProfileViewModel extends BaseViewModel {
  final authService = locator<AuthServices>();
}
