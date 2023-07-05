import 'dart:ui';
import 'package:admin_doctor_patent/templete/adminlogin.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'adminviewdoctor.dart';
import 'adminviewpatient.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    print("$h x $w");

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Image(
              image: const AssetImage('assets/doctorphone.jpg'),
              height: h * 0.3,
            ),
            SlidingUpPanel(
              maxHeight: h * 0.75,
              defaultPanelState: PanelState.OPEN,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              body: Container(),
              panelBuilder: (c) {
                return Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.024),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: h * 0.065,
                          child: Text(
                            'Virtual Clinic',
                            style: TextStyle(
                                fontSize: w * 0.09,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  Divider(
                    thickness: 3,
                    height: h * 0.20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            Get.to(AdminViewDoctor());
                          },
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.admin_panel_settings_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Doctor',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(AdminViewPatient());
                        },
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.admin_panel_settings_sharp,
                                color: Colors.white,
                              ),
                              Text('Patient',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(LoginPage());
                        },
                        child: Container(
                          height: 60,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Logout',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
