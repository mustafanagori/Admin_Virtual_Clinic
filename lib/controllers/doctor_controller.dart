import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/doctor_model.dart';

class DoctorController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchCustomerData();
  }

  List<DoctorModel> _list = [];
  List<DoctorModel> get getList => _list;
  fetchCustomerData() async {
    await FirebaseFirestore.instance
        .collection("doctors")
        .get()
        .then((QuerySnapshot snapshot) {
      _list = [];
      for (var documents in snapshot.docs) {
        Map<String, dynamic> dataMap = documents.data() as Map<String, dynamic>;
        _list.insert(
            0, DoctorModel.fromMap(map: dataMap, userID: documents.id.trim()));
      }
    });
    update();
  }

  DoctorModel getDoctorById(String userID) {
    return _list
        .firstWhere((element) => element.userID.trim() == userID.trim());
  }

  DoctorModel getCustomerByName(String firstName) {
    return _list
        .where((element) => element.firstName.trim() == firstName.trim())
        .first;
  }

  deleteData({required String userID}) async {
    await FirebaseFirestore.instance.collection("doctors").doc(userID).delete();
    _list.removeWhere(
      (element) => element.userID == userID,
    );
    update();
  }
}
