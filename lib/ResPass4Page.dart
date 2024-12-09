import 'package:flutter/material.dart';
import 'package:sih_main_page/NewPass5Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResPass4Page(),
    );
  }
}

class ResPass4Page extends StatelessWidget {
  const ResPass4Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // App logo or image
            const SizedBox(height: 60),
            Image.asset(
              'assets/Images/paper plane.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(height:05),

            // Text description
            const Text(
              'Password reset\n e-mail has been sent',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 80),

            // Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPass5Page(),));
              },
              child: const Text(
                'Set a new password',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}