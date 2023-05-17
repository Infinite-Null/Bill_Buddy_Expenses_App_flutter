import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  var persons = [].obs;
  void addPerson(String name) {
    persons.add({
      "name": name,
      "Transections": [],
      "oweAmount": 0.0,
      "recieveAmount": 0.0
    });
    saveData();
    persons.refresh();
  }

  void saveData() {
    GetStorage("Box").write("person", persons.value);
  }

  void readData() {
    persons.value = GetStorage("Box").read("person") ?? [];
  }

  void removePerson(int index) {
    persons.removeAt(index);
    saveData();
    persons.refresh();
  }

  void renamePerson(int index, String newName) {
    persons[index]["name"] = newName;
    saveData();
    persons.refresh();
  }

//----------------------------------
  void addAmountToOweOrRecieve(int index, int i) {
    if (persons[index]["Transections"][i]["type"] == "Give") {
      // print("hi");
      persons[index]["oweAmount"] +=
          persons[index]["Transections"][i]["amount"];
    }
    if (persons[index]["Transections"][i]["type"] == "Get") {
      // print("hi");
      persons[index]["recieveAmount"] +=
          persons[index]["Transections"][i]["amount"];
    }
    saveData();
    persons.refresh();
  }

  void calAmountdelete(int index, int i) {
    if (persons[index]["Transections"][i]["type"] == "Give") {
      // print("hi");
      persons[index]["oweAmount"] -=
          persons[index]["Transections"][i]["amount"];
    }
    if (persons[index]["Transections"][i]["type"] == "Get") {
      // print("hi");
      persons[index]["recieveAmount"] -=
          persons[index]["Transections"][i]["amount"];
    }
    saveData();
    persons.refresh();
  }

  void addTransection(
      int index, String name, double amount, String type, String date) {
    persons[index]["Transections"].add({
      "name": name,
      "amount": amount,
      "type": type,
      "date": date,
    });
    addAmountToOweOrRecieve(index, persons[index]["Transections"].length - 1);
    saveData();
    persons.refresh();
  }

  void removeTransection(int index, int i) {
    calAmountdelete(index, i);
    persons[index]["Transections"].removeAt(i);
    saveData();
    print("done");
    persons.refresh();
  }
}
