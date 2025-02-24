
import 'package:flutter/material.dart';

import 'login.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 255, 238),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'lib/assets/logo.png',
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'CELESTE',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'baskerville'),
        ),
        SizedBox(
          height: 40,
        ),
        TextButton(
            style: OutlinedButton.styleFrom(
                fixedSize: Size(200, 50),
                // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1),
                backgroundColor: const Color(0xFF86C133)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              );
            },
            child: Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ))
      ]),
    );
  }
}
