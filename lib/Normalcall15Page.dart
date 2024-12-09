import 'package:flutter/material.dart';

class Normalcall15Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/Images/baby.png'), // Replace with your image path
            ),
            SizedBox(height: 20),
            Text(
              'Calling',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Bella',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.volume_up, color: Colors.white),
                  onPressed: () {
                    // Handle mute/unmute
                  },
                ),
                IconButton(
                  icon: Icon(Icons.call_end, color: Colors.white),
                  onPressed: () {
                    // Handle call end
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle call accept
              },
              child: Icon(Icons.call, size: 40),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}