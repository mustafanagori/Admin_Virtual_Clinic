import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_appoint.dart';
import '../controllers/doctor_controller.dart';
import '../controllers/doctor_schedule_controlller.dart';
import '../core/colors.dart';
import '../models/doctor_model.dart';
import 'adminhome.dart';
import 'details_doctor.dart';

class AdminViewDoctor extends StatefulWidget {
  const AdminViewDoctor({Key? key}) : super(key: key);

  @override
  State<AdminViewDoctor> createState() => _AdminViewDoctorState();
}

Future<bool> _check(DoctorModel doctorModel) async {
  bool isAcceptedorRejected = false;
  await FirebaseFirestore.instance
      .collection("users")
      .doc(doctorModel.userID)
      .get()
      .then((DocumentSnapshot? snapshot) {
    if (snapshot != null && snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      if (data["rool"] == "Doctor") {
        if (data["isVerified"] == "verified" ||
            data["isVerified"] == "rejected") {
          isAcceptedorRejected = true;
        }
      }
    }
  });
  return isAcceptedorRejected;
}

final dsController = Get.put(DoctorSchedulesController());

final caController = Get.put(CreateAppointmentController());
final doctorController = Get.find<DoctorController>();

class _AdminViewDoctorState extends State<AdminViewDoctor> {
  @override
  Widget build(BuildContext context) {
    doctorController.fetchCustomerData();
    final doctorList = doctorController.getList;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 0.25 * h,
          width: double.infinity,
          //color: Colors.amber,
          decoration: new BoxDecoration(
              color: Colors.red,
              borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0))),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0.07 * h, left: 0.05 * w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.off(AdminHome());
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 0.18 * w,
                    ),
                    Center(
                      child: Text(
                        "Virtual Doctor",
                        style:
                            TextStyle(color: Colors.white, fontSize: 0.07 * w),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 0.05 * h,
              ),
              Text(
                "Doctor Details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 0.07 * w,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          height: 0 * h,
        ),
        Expanded(
          child: GetBuilder<DoctorController>(
              builder: (controller) => ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: doctorList.length,
                    itemBuilder: (context, index) => DoctorCard(
                      onViewDetails: () async {
                        bool temp = await _check(doctorList[index]);
                        Get.to(DoctorDetails(
                          isTrue: temp,
                          currentUser: doctorList[index],
                        ));
                      },
                      onReject: () async {
                        const CircularProgressIndicator();

                        final caList = caController.getList.where((element) =>
                            element.doctorID == doctorList[index].userID);
                        final dsList = dsController.getList.where((element) =>
                            element.doctorID == doctorList[index].userID);

                        for (final doc in caList) {
                          print(doc.userID);
                          await caController.deleteData(docID: doc.userID);
                        }
                        for (final doc in dsList) {
                          print(doc.userID);
                          await dsController.deleteData(userID: doc.userID);
                        }

                        await doctorController.deleteData(
                            userID: doctorList[index].userID);

                        Navigator.pop(context);
                      },
                      degprogram: doctorList[index].degprogram,
                      cgpa: doctorList[index].cgpa,
                      firstName: doctorList[index].firstName,
                      lastName: doctorList[index].lastName,
                      cnic: doctorList[index].cnic,
                      contact: doctorList[index].contact,
                      gender: doctorList[index].gender,
                      passyear: doctorList[index].passyear,
                      prno: doctorList[index].prno,
                      skills: doctorList[index].skills,
                      spealization: doctorList[index].spealization,
                      uniname: doctorList[index].uniname,
                    ),
                  )),
        ),
      ],
    )
        // body: Stack(
        //   children: [
        //     Image(
        //       image: AssetImage(
        //           'assets/sl-telehealth-smartphone-doctor-1200x600.jpeg'),
        //       height: h * 0.3,
        //     ),

        //     ///body

        //     SlidingUpPanel(
        //       maxHeight: h * 0.75,
        //       defaultPanelState: PanelState.OPEN,
        //       borderRadius: BorderRadius.vertical(
        //         top: Radius.circular(20),
        //       ),
        //       body: Container(),
        //       panelBuilder: (c) {
        //         return Stack(children: [
        //           Padding(
        //             padding: EdgeInsets.only(top: h * 0.024),
        //             child: Align(
        //                 alignment: Alignment.topCenter,
        //                 child: Container(
        //                   height: h * 0.065,
        //                   child: Text(
        //                     'Doctor Detial',
        //                     style: TextStyle(
        //                         fontSize: w * 0.09, fontWeight: FontWeight.bold),
        //                   ),
        //                 )),
        //           ),
        //           Divider(
        //             thickness: 3,
        //             height: h * 0.20,
        //           ),
        //           Container(
        //             height: ,
        //             width: 5,
        //             color: Colors.red,
        //           )
        //           // SingleChildScrollView(
        //           //   child: Column(
        //           //     children: [
        //           //       Text('Doctor Detial'),
        //           //       Container(
        //           //         height: 5 * h,
        //           //         width: 2 * w,
        //           //         color: Colors.black,
        //           //       )
        //           //     ],
        //           //   ),
        //           // )
        //         ]);
        //       },
        //     ),
        //   ],
        // ),
        );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.contact,
    required this.prno,
    required this.cnic,
    required this.gender,
    required this.uniname,
    required this.degprogram,
    required this.passyear,
    required this.skills,
    required this.cgpa,
    required this.spealization,
    required this.onReject,
    required this.onViewDetails,
  }) : super(key: key);
  final String firstName;
  final String lastName;
  final String contact;
  final String prno;
  final String cnic;
  final String gender;
  final String uniname;
  final String degprogram;
  final String passyear;
  final String skills;
  final String cgpa;
  final String spealization;
  final void Function()? onReject;
  final void Function()? onViewDetails;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 0.25 * h,
        width: 0.9 * w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.btnlogingreyGreen,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 0.01 * h,
            ),
            Text(
              'Doctor Name',
              style: TextStyle(
                  //  color: Colors.white,
                  fontSize: 0.06 * w,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              firstName + " " + lastName,
              style: TextStyle(
                //  color: Colors.white,
                fontSize: 0.04 * w,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Doctor PrNo",
              style: TextStyle(
                  //  color: Colors.white,
                  fontSize: 0.06 * w,
                  fontWeight: FontWeight.bold
                  //
                  //  fontWeight: FontWeight.bold
                  ),
            ),
            Text(
              prno,
              style: TextStyle(
                //  color: Colors.white,
                fontSize: 0.04 * w,
                //
                //  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 0.04 * h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  //   width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      // side: BorderSide(
                      //   width: 1.0,
                      //   color: Colors.blueAccent,
                      // ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: onReject,
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  //   width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      // side: BorderSide(
                      //   width: 1.0,
                      //   color: Colors.blueAccent,
                      // ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: onViewDetails,
                    child: Text(
                      ' Details',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
