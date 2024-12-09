import 'package:flutter/material.dart';
import 'package:sih_main_page/ConfPass6Page.dart';
import 'package:sih_main_page/Loginpage2.dart';


class NewPass5Page extends StatelessWidget {
  const NewPass5Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // Blue Header
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                child: const SizedBox(),

              ),
              const SizedBox(height: 40),
              // Main Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'CREATE NEW PASSWORD\n Please, enter a new password below.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Password Fields
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // New Password
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'New password',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: const Icon(Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Confirm New Password
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm new password',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: const Icon(Icons.visibility_off),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Save Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage2(),));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}