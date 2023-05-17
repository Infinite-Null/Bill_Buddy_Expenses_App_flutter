import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SystemData extends GetxController {
  var selected = 0.obs;
  var gender = "Male".obs;
  var name = '--'.obs;
  var isIn = false.obs;
  void saveData() {
    GetStorage("Box").write("gender", gender.value);
    GetStorage("Box").write("name", name.value);
    GetStorage("Box").write("isIn", isIn.value);
    GetStorage('Box').write("selected", selected.value);
  }

  void retrive() {
    gender.value = GetStorage("Box").read("gender") ?? "Male";
    name.value = GetStorage("Box").read("name") ?? "--";
    isIn.value = GetStorage("Box").read("isIn") ?? false;
    selected.value = GetStorage("Box").read("selected") ?? 0;
  }
}
