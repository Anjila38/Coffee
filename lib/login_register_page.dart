// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';

// import 'auth.dart';

// class LoginRegisterPage extends StatefulWidget {
//   const LoginRegisterPage({super.key});

//   @override
//   State<LoginRegisterPage> createState() => _LoginRegisterPageState();
// }

// class _LoginRegisterPageState extends State<LoginRegisterPage> {
//   String? error ='';
//   bool isLogin = true;

//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();

//   Future<void> signInWithEmailAndPassword() async{
//     try{
//       await Auth().signInWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
//     } on FirebaseAuthException catch(e){
//       setState(() {
//         error = e.message;
//       });
//     }
//   }

//   Future<void> createUserWithEmailAndPassword() async{
//     try{
//       await Auth().createUserWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
//     }on FirebaseAuthException catch(e){
//       setState(() {
//         error = e.message;
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:coffee/auth.dart';
import 'package:coffee/pages/homepage.dart';
import 'package:coffee/pages/login.dart';
import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: Auth().authstateChanges, builder: (context, snapshot) {
      // if(snapshot.hasData){
      //   return Homepage();
      // } else{
        return LoginPage();
      // }
    },);
  }
}