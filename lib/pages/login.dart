// import 'package:coffee/pages/homepage.dart';
// import 'package:coffee/pages/signup.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(CoffeeLoginApp());
// }

// class CoffeeLoginApp extends StatelessWidget {
//   const CoffeeLoginApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 238, 255, 238),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(20),
//             width: 320,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(25),
//               boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.coffee, size: 50, color: Color(0xFF86C133)),
//                 SizedBox(height: 10),
//                 Text("Welcome Back!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF86C133))),
//                 SizedBox(height: 10),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: "Email",
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.email, color: Color(0xFF86C133)),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: "Password",
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.lock, color: Color(0xFF86C133)),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) {
//                       return Homepage();
//                     },));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF86C133),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 12),
//                     child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18)),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Don't have an account?", style: TextStyle(color: Colors.grey[700])),
//                     SizedBox(width: 5),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) {
//                           return SignUpPage();
//                         },));
//                       },
//                       child: Text("Sign Up", style: TextStyle(color: Color(0xFF86C133), fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:coffee/pages/homepage.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerEmail = TextEditingController();
    TextEditingController _controllerPassword = TextEditingController();
    String? error;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 255, 238),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.coffee, size: 50, color: Color(0xFF86C133)),
                SizedBox(height: 10),
                Text("Welcome Back!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF86C133))),
                SizedBox(height: 10),
                TextField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Color(0xFF86C133)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _controllerPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF86C133)),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await Auth().signInWithEmailAndPassword(
                        email: _controllerEmail.text,
                        password: _controllerPassword.text,
                      );
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
                    } catch (e) {
                      error = e.toString(); // Capture any error messages
                      print(error); // You can show this error in the UI if needed
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF86C133),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(color: Colors.grey[700])),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return SignUpPage();
                        }));
                      },
                      child: Text("Sign Up", style: TextStyle(color: Color(0xFF86C133), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
