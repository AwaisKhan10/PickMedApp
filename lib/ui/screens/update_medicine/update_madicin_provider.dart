import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/medicine.dart';
import 'package:pickmed/core/model/response/add_medicine_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/data_base_services.dart';

class UpdateMadicinProvider extends BaseViewModel {
  String value = '';
  Medicine medicine = Medicine();
  // ApiBaseResponse res = ApiBaseResponse(false);
  MedicineResponse? response;
  final db = DatabaseService();

  List<Medicine> medicins = [];

  UpdateMadicinProvider() {
    getAllMedicins();
  }

  getAllMedicins() async {
    setState(ViewState.busy);
    response = await db.getMadicins();
    if (response!.success == true) {
      medicins = response!.resp;
    }
    setState(ViewState.idle);
  }
}
