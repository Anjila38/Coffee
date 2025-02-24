import 'package:coffee/login_register_page.dart';
import 'package:coffee/pages/login.dart';
import 'package:coffee/pages/welcomepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginRegisterPage(),
    );
  }
}