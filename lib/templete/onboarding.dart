 
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../core/colors.dart';
import 'adminlogin.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    print("$h x $w");

    return Scaffold(
      body: PageView(
        children: [
          Container(
            child: Stack(
              children: [
                ///bg
                Container(
                  child: SvgPicture.asset(
                    "assets/BG.svg",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),

                ///body
                Padding(
                  padding: EdgeInsets.fromLTRB(0, w * 0.22, w * 0.050, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.off(LoginPage());
                          },
                          child: Padding(
                            padding: EdgeInsets.all(h * 0.01),
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  color: Color.fromARGB(215, 11, 11, 11),
                                  fontSize: h * 0.03),
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.lightPink),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(color: Colors.black)))))
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(w * 0.08, h * 0.20, 0, 0),
                  child: SizedBox(
                    child: Text(
                      "VIRTUAL CLINIC",
                      style: TextStyle(
                        fontSize: w * 0.066,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(w * 0.08, h * 0.26, 0, 0),
                  child: SizedBox(
                    child: Text(
                      "A Project of Virtual Clinic",
                      style: TextStyle(
                          fontSize: w * 0.040, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(w * 0.08, h * 0.36, 0, 0),
                  child: SizedBox(
                    child: Text(
                      "Semper in cursus magna et eu varius \n nunc adipiscing. Elementum justo,\n laoreet id sem semper parturient.",
                      style: TextStyle(fontSize: h * 0.020),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(w * 0.28, h * 0.36, 0, h * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: w * 0.9,
                          height: h * 0.5,
                          child:
                              Image.asset("assets/Doctor and patient (1).png")),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Stack(children: [
              Container(
                child: SvgPicture.asset(
                  "assets/bg2.svg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, w * 0.22, w * 0.050, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.off(LoginPage());
                        },
                        child: Padding(
                          padding: EdgeInsets.all(h * 0.01),
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                color: Color.fromARGB(215, 11, 11, 11),
                                fontSize: h * 0.03),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.yellow1),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.black)))))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(w * 0.08, h * 0.20, 0, 0),
                child: SizedBox(
                  child: Text(
                    "VIRTUAL CLINIC",
                    style: TextStyle(
                      fontSize: w * 0.066,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(w * 0.08, h * 0.26, 0, 0),
                child: SizedBox(
                  child: Text(
                    "A Project of Virtual Clinic",
                    style: TextStyle(
                        fontSize: w * 0.040, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(w * 0.08, h * 0.36, 0, 0),
                child: SizedBox(
                  child: Text(
                    "Semper in cursus magna et eu varius \n nunc adipiscing. Elementum justo,\n laoreet id sem semper parturient.",
                    style: TextStyle(fontSize: h * 0.020),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(w * 0.28, h * 0.36, 0, h * 0.02),
              //  child:
              Positioned(
                right: 1,
                bottom: 1,
                child: SizedBox(
                    child: Image.asset(
                        scale: 4,
                        "assets/Woman doctor in a mask and gloves administering vaccine to a man.png")),
              ),
              // )
            ]),
          ),
          Container(
            child: Stack(children: [
              Container(
                child: SvgPicture.asset(
                  "assets/BG3.svg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, w * 0.22, w * 0.050, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.off(LoginPage());
                        },
                        child: Padding(
                          padding: EdgeInsets.all(h * 0.01),
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                color: Color.fromARGB(215, 11, 11, 11),
                                fontSize: h * 0.03),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.gray1),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.black)))))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(w * 0.08, h * 0.20, 0, 0),
                child: SizedBox(
                  child: Text(
                    "VIRTUAL CLINIC",
                    style: TextStyle(
                      fontSize: w * 0.066,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(w * 0.08, h * 0.26, 0, 0),
                child: SizedBox(
                  child: Text(
                    "A Project of Virtual Clinic",
                    style: TextStyle(
                        fontSize: w * 0.040, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(w * 0.08, h * 0.36, 0, 0),
                child: SizedBox(
                  child: Text(
                    "Semper in cursus magna et eu varius \n nunc adipiscing. Elementum justo,\n laoreet id sem semper parturient.",
                    style: TextStyle(fontSize: h * 0.020),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: w * 15,
                      height: h * 0.49,
                      child: Image.asset("assets/Thirdpagepic.png")),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
