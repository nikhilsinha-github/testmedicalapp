import 'package:get/get.dart';
import 'package:testmedicalapp/model/medicines_model.dart';
import 'package:testmedicalapp/util/constants.dart';
import 'package:testmedicalapp/util/services.dart';

class MedicinesController extends GetxController {
  RxList<Medicines> medicines = <Medicines>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMedicines();
  }

  getMedicines() async {
    Response response = await Services().getResponse(medicinesAPI);
    if (response.statusCode == 200) {
      medicines.addAll(MedicinesModel.fromJson(response.body).medicines);
      print(medicines[0].name);
    }
  }
}
