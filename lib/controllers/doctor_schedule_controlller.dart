import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/doctor_scheduleModel.dart';

class DoctorSchedulesController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  List<DoctorScheduleModel> _list = [];
  List<DoctorScheduleModel> get getList => _list;
  fetchData() async {
    await FirebaseFirestore.instance
        .collection("doctorSchedule")
        .get()
        .then((QuerySnapshot snapshot) {
      _list = [];
      for (var documents in snapshot.docs) {
        Map<String, dynamic> dataMap = documents.data() as Map<String, dynamic>;
        _list.insert(
            0,
            DoctorScheduleModel.fromMap(
                map: dataMap, userID: documents.id.trim()));
      }
    });
    update();
  }

  DoctorScheduleModel getById(String userID) {
    return _list
        .firstWhere((element) => element.userID.trim() == userID.trim());
  }

  uploadData(
      {required String startTime,
      required String endTime,
      required String day,
      required String docID,
      required String fees}) async {
    await FirebaseFirestore.instance.collection("doctorSchedule").add({
      "startTime": startTime,
      "endTime": endTime,
      "doctorID": docID,
      "day": day,
      "fees": fees,
    });
    update();

    fetchData();
  }

  deleteData({required String userID}) async {
    await FirebaseFirestore.instance
        .collection("doctorSchedule")
        .doc(userID)
        .delete();
    _list.removeWhere(
      (element) => element.userID == userID,
    );
    update();
  }
}
