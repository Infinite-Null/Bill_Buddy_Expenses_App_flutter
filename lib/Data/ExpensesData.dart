import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ExpensesData extends GetxController {
  var expenses = [].obs;
  void addExpense(String name, double amount, String type, String date) {
    expenses.add({
      "name": name,
      "amount": amount,
      "type": type,
      "date": date,
    });
    saveData();
  }

  void saveData() {
    GetStorage("Box").write("expense", expenses.value);
  }

  void readData() {
    expenses.value = GetStorage("Box").read("expense") ?? [];
  }

  void removeExpense(int index) {
    expenses.removeAt(index);
    saveData();
  }
}
