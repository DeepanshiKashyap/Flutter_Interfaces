import 'package:flutter/material.dart';

void main() {
  runApp(Profile17Page());
}

class Profile17Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 05),
            Image.asset ('assets/Images/profilepic.png',height: 200,width: 200),
            SizedBox(height: 05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ishaan Ruhela',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 20,
                ),
              ],
            ),
            SizedBox(height: 05),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 40),
                children: [
                  buildButton(Icons.person, 'My Profile'),
                  buildButton(Icons.mail, 'Messages'),
                  buildButton(Icons.favorite, 'Favorite'),
                  buildButton(Icons.location_on, 'Location'),
                  buildButton(Icons.settings, 'Settings'),
                  SizedBox(height: 05),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Handle logout action
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
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

  Widget buildButton(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ElevatedButton.icon(
        onPressed: () {
          // Handle button action
        },
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        label: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade300,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}