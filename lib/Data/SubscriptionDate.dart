import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SubscriptionData extends GetxController {
  var subscriptions = [].obs;
  void addSubscription(String name, double amount, String from, String to) {
    subscriptions.add({"name": name, "amount": amount, "from": from, "to": to});
    saveData();
  }

  void saveData() {
    GetStorage("Box").write("sub", subscriptions.value);
  }

  void readData() {
    subscriptions.value = GetStorage("Box").read("sub") ?? [];
  }

  void removeSubs(int index) {
    subscriptions.removeAt(index);
    saveData();
  }
}
