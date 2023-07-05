// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../core/utils.dart';
// import '../helper/size_configuration.dart';
// import 'adminlogin.dart';
// // import 'model.dart';

// class Register extends StatefulWidget {
//   const Register({super.key});

//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   _RegisterState();

//   bool showProgress = false;
//   bool visible = false;
//   bool confrimPass = false;
//   final _formkey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;

//   final TextEditingController passwordController = new TextEditingController();
//   final TextEditingController confirmpassController =
//       new TextEditingController();
//   final TextEditingController name = new TextEditingController();
//   final TextEditingController emailController = new TextEditingController();
//   final TextEditingController mobile = new TextEditingController();
//   bool _isObscure = true;
//   File? file;
 

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(
//               "Registeration",
//               style: TextStyle(fontSize: 30),
//             ),
//             backgroundColor: Colors.red,
//           ),
//           // backgroundColor: Colors.red,
//           body: SingleChildScrollView(
//             child: SafeArea(
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             fit: BoxFit.cover,
//                             colorFilter: new ColorFilter.mode(
//                                 Colors.black.withOpacity(0.8),
//                                 BlendMode.dstATop),
//                             image: AssetImage("Assets/TELEHEALTH-1.jpeg"))),
//                     //    color: Colors.orangeAccent[700],
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     child: SingleChildScrollView(
//                       child: Container(
//                         margin: EdgeInsets.all(12),
//                         child: Form(
//                           key: _formkey,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 height: getProportionateScreenHeight(80),
//                               ),
//                               Text(
//                                 "Register Now",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                   fontSize: 40,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: getProportionateScreenHeight(50),
//                               ),
//                               TextFormField(
//                                 controller: emailController,
//                                 decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   hintText: 'Email',
//                                   enabled: true,
//                                   contentPadding: const EdgeInsets.only(
//                                       left: 14.0, bottom: 8.0, top: 8.0),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide:
//                                         new BorderSide(color: Colors.white),
//                                     borderRadius: new BorderRadius.circular(20),
//                                   ),
//                                   enabledBorder: UnderlineInputBorder(
//                                     borderSide:
//                                         new BorderSide(color: Colors.white),
//                                     borderRadius: new BorderRadius.circular(20),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value!.length == 0) {
//                                     return "Email cannot be empty";
//                                   }
//                                   if (!RegExp(
//                                           "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                                       .hasMatch(value)) {
//                                     return ("Please enter a valid email");
//                                   } else {
//                                     return null;
//                                   }
//                                 },
//                                 onChanged: (value) {},
//                                 keyboardType: TextInputType.emailAddress,
//                               ),
//                               SizedBox(
//                                 height: getProportionateScreenHeight(20),
//                               ),
//                               TextFormField(
//                                 obscureText: _isObscure,
//                                 controller: passwordController,
//                                 decoration: InputDecoration(
//                                   suffixIcon: IconButton(
//                                       icon: Icon(_isObscure
//                                           ? Icons.visibility_off
//                                           : Icons.visibility),
//                                       onPressed: () {
//                                         setState(() {
//                                           _isObscure = !_isObscure;
//                                         });
//                                       }),
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   hintText: 'Password',
//                                   enabled: true,
//                                   contentPadding: const EdgeInsets.only(
//                                       left: 14.0, bottom: 8.0, top: 15.0),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide:
//                                         new BorderSide(color: Colors.white),
//                                     borderRadius: new BorderRadius.circular(20),
//                                   ),
//                                   enabledBorder: UnderlineInputBorder(
//                                     borderSide:
//                                         new BorderSide(color: Colors.white),
//                                     borderRadius: new BorderRadius.circular(20),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   RegExp regex = new RegExp(r'^.{6,}$');
//                                   if (value!.isEmpty) {
//                                     return "Password cannot be empty";
//                                   }
//                                   if (!regex.hasMatch(value)) {
//                                     return ("please enter valid password min. 6 character");
//                                   } else {
//                                     return null;
//                                   }
//                                 },
//                                 onChanged: (value) {},
//                               ),
//                               SizedBox(
//                                 height: getProportionateScreenHeight(20),
//                               ),
//                               TextFormField(
//                                 obscureText: _isObscure,
//                                 controller: confirmpassController,
//                                 decoration: InputDecoration(
//                                   suffixIcon: IconButton(
//                                       icon: Icon(_isObscure
//                                           ? Icons.visibility_off
//                                           : Icons.visibility),
//                                       onPressed: () {
//                                         setState(() {
//                                           _isObscure = !_isObscure;
//                                         });
//                                       }),
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   hintText: 'Confirm Password',
//                                   enabled: true,
//                                   contentPadding: const EdgeInsets.only(
//                                       left: 14.0, bottom: 8.0, top: 15.0),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide:
//                                         new BorderSide(color: Colors.white),
//                                     borderRadius: new BorderRadius.circular(20),
//                                   ),
//                                   enabledBorder: UnderlineInputBorder(
//                                     borderSide:
//                                         new BorderSide(color: Colors.white),
//                                     borderRadius: new BorderRadius.circular(20),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (confirmpassController.text !=
//                                       passwordController.text) {
//                                     return "Password did not match";
//                                   } else {
//                                     return null;
//                                   }
//                                 },
//                                 onChanged: (value) {},
//                               ),
//                               SizedBox(
//                                 height: getProportionateScreenHeight(40),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Types : ",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black,
//                                     ),
//                                   ),
                                 
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: getProportionateScreenHeight(60),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   MaterialButton(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(20.0))),
//                                     elevation: 5.0,
//                                     height: getProportionateScreenHeight(40),
//                                     onPressed: () {
//                                       CircularProgressIndicator();
//                                       Navigator.pushReplacement(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => LoginPage(),
//                                         ),
//                                       );
//                                     },
//                                     child: Text(
//                                       "Login",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20,
//                                           color: Colors.white),
//                                     ),
//                                     color: Colors.red,
//                                   ),
//                                   MaterialButton(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(20.0))),
//                                     elevation: 5.0,
//                                     height: getProportionateScreenHeight(40),
//                                     onPressed: () {
//                                       setState(() {
//                                         showProgress = true;
//                                       });
//                                       try {
//                                         signUp(emailController.text,
//                                             passwordController.text);
//                                       } catch (e) {
//                                         Utils().toastMessage(e.toString());
//                                       }
//                                     },
//                                     child: Text(
//                                       "Register",
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     color: Colors.red,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: getProportionateScreenHeight(20),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void signUp(String email, String password) async {
//     const CircularProgressIndicator();
//     if (_formkey.currentState!.validate()) {
//       await _auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((value) => {postDetailsToFirestore(email)})
//           // ignore: body_might_complete_normally_catch_error
//           .catchError((e) {
//         Utils().toastMessage(e.toString());
//       });
//     }
//   }

//   postDetailsToFirestore(String email, String rool) async {
//     var user = _auth.currentUser;
//     CollectionReference ref = FirebaseFirestore.instance.collection('admin');
//     ref.doc(user!.uid).set({
//       'email': emailController.text,
//       
//     });

//     Utils().toastMessage("Registered Sucessfully");
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => LoginPage()));
//   }
// }
