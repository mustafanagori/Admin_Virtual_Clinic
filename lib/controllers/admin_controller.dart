import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/admin_model.dart';

class AdminController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchCustomerData();
  }

  List<AdminModel> _list = [];
  List<AdminModel> get getList => _list;
  fetchCustomerData() async {
    await FirebaseFirestore.instance
        .collection("admin")
        .get()
        .then((QuerySnapshot snapshot) {
      _list = [];
      for (var documents in snapshot.docs) {
        Map<String, dynamic> dataMap = documents.data() as Map<String, dynamic>;
        _list.insert(
            0, AdminModel.fromMap(map: dataMap, userID: documents.id.trim()));
      }
    });
    update();
  }

  AdminModel getPatientById(String userID) {
    return _list
        .firstWhere((element) => element.userID.trim() == userID.trim());
  }

  AdminModel getPatientByName(String firstName) {
    return _list
        .where((element) => element.name.trim() == firstName.trim())
        .first;
  }

  deletePatientData({required String userID}) async {
    await FirebaseFirestore.instance
        .collection("patients")
        .doc(userID)
        .delete();
    _list.removeWhere(
      (element) => element.userID == userID,
    );
    update();
  }
}
