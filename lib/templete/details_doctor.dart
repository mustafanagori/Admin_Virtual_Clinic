import 'package:admin_doctor_patent/models/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/size_configuration.dart';
import '../controllers/doctor_controller.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails(
      {Key? key, required this.currentUser, required this.isTrue})
      : super(key: key);
  final DoctorModel currentUser;
  final bool isTrue;
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  TextEditingController speacialization = TextEditingController();
  final doctorController = Get.put(DoctorController);

  @override
  Widget build(BuildContext context) {
    final doctorModel = widget.currentUser;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Doctor Details',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.dstATop),
                  image: AssetImage("Assets/TELEHEALTH-1.jpeg"))),
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pr No',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    doctorModel.prno,
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 4, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    doctorModel.firstName.toString() +
                        " " +
                        doctorModel.lastName.toString(),
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone Number',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    doctorModel.contact,
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Gender',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    doctorModel.gender,
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Divider(),
            SizedBox(
              height: getProportionateScreenHeight(4),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Speacialization',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
              child: Padding(
                padding: EdgeInsets.only(top: 3, left: 6),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Text(
                      doctorModel.spealization,
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'University Name',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    doctorModel.uniname,
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Degree Program',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    doctorModel.degprogram,
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Year Of Passing',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    doctorModel.passyear,
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CGPA',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    doctorModel.cgpa,
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Skills',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    doctorModel.skills,
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            widget.isTrue
                ? Container()
                : Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SizedBox(
                            height: getProportionateScreenHeight(50),
                            width: getProportionateScreenWidth(100),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () async {
                                  const CircularProgressIndicator();

                                  FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(doctorModel.userID)
                                      .update({"isVerified": "rejected"}).then(
                                          (value) {
                                    Navigator.pop(context);
                                  }).catchError(
                                    (error) => print(error),
                                  );
                                },
                                child: Text(
                                  "Reject",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SizedBox(
                            height: getProportionateScreenHeight(50),
                            width: getProportionateScreenWidth(100),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(doctorModel.userID)
                                      .update({"isVerified": "verified"}).then(
                                          (value) {
                                    Navigator.pop(context);
                                  }).catchError(
                                    // ignore: avoid_print
                                    (error) => print(error),
                                  );
                                  ;
                                },
                                child: const Text(
                                  "Accept",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                          ),
                        ),
                      ),
                    ],
                  )
          ]),
        )));
  }
}
