import 'package:admin_doctor_patent/controllers/create_appoint.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../controllers/patient_controller.dart';
import '../core/colors.dart';
import 'adminhome.dart';

class AdminViewPatient extends StatefulWidget {
  const AdminViewPatient({Key? key}) : super(key: key);

  @override
  State<AdminViewPatient> createState() => _AdminViewPatientState();
}

final patientController = Get.find<PatientController>();
final caController = Get.put(CreateAppointmentController());

class _AdminViewPatientState extends State<AdminViewPatient> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    final patientList = patientController.getList;
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
                "Patient Details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 0.07 * w,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: GetBuilder<PatientController>(
              builder: (controller) => ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: patientList.length,
                    itemBuilder: (context, index) => DoctorCard(
                      onDelete: () async {
                        const CircularProgressIndicator();
                        //APOINTMENT DELETE
                        final caList = caController.getList.where((element) =>
                            element.patientID == patientList[index].userID);
                        for (final doc in caList) {
                          await caController.deleteData(docID: doc.sheduleID);
                        }
//PATIENT INFORMATION DELETE
                        await patientController.deletePatientData(
                            userID: patientList[index].userID);
                        Navigator.pop(context);
                      },
                      firstName: patientList[index].name,
                      cnic: patientList[index].cnic,
                      contact: patientList[index].contact,
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
    required this.contact,
    required this.cnic,
    required this.onDelete,
  }) : super(key: key);
  final String firstName;
  final String contact;
  final String cnic;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 0.30 * h,
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
              'Name',
              style: TextStyle(
                  //  color: Colors.white,
                  fontSize: 0.06 * w,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              firstName,
              style: TextStyle(
                //  color: Colors.white,
                fontSize: 0.04 * w,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "CNIC",
              style: TextStyle(
                  //  color: Colors.white,
                  fontSize: 0.06 * w,
                  fontWeight: FontWeight.bold
                  //
                  //  fontWeight: FontWeight.bold
                  ),
            ),
            Text(
              cnic,
              style: TextStyle(
                //  color: Colors.white,
                fontSize: 0.04 * w,
                //
                //  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Contact",
              style: TextStyle(
                  //  color: Colors.white,
                  fontSize: 0.06 * w,
                  fontWeight: FontWeight.bold
                  //
                  //  fontWeight: FontWeight.bold
                  ),
            ),
            Text(
              contact,
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
                SizedBox(
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
                    onPressed: onDelete,
                    child: Text(
                      'Delete ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
