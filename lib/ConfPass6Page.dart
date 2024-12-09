import 'package:flutter/material.dart';
import 'package:sih_main_page/CreateAcc7Page.dart';

class ConfPass6Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PasswordConfirmationScreen(),
    );
  }
}

class PasswordConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100.0,
              color: Colors.black,
            ),
            SizedBox(height: 20.0),
            Text(
              'New password confirmed successful',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'You have successfully confirmed your new password. Please use your new password when logging in.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(

              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAcc7Page(),));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              ),
              child: Text(
                'Okay',
                style: TextStyle(fontSize: 18.0,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}