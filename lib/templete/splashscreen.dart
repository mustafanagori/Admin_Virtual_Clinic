import 'dart:async';
import 'package:admin_doctor_patent/templete/adminhome.dart';
import 'package:admin_doctor_patent/templete/adminlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/doctor_controller.dart';
import '../controllers/patient_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    Get.put(DoctorController());
    Get.put(PatientController());
    if (user != null) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => (AdminHome()))));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => (LoginPage()))));
    }
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 154, 185, 71),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/vc.gif')],
      ),
    );
  }
}
