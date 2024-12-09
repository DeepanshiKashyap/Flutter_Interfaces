import 'package:flutter/material.dart';
import 'package:sih_main_page/ResPass4Page.dart';

void main() => runApp(Forget3Page());


class Forget3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgotPasswordScreen(),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 80,
              color: Colors.lightBlueAccent,
            ),
            SizedBox(height: 50),
            Text(
              "Forgot your password?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "Mobile number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "or",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "E-mail I'd",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ResPass4Page(),));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}