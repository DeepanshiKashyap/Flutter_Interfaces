import 'package:flutter/material.dart';
import 'package:sih_main_page/CallScreen11Page.dart';
import 'package:sih_main_page/CallText14Page.dart';
import 'package:sih_main_page/LangTrans16Page.dart';
import 'package:sih_main_page/Profile17Page.dart';
import 'package:sih_main_page/Transcrip13Page.dart';

class SelectWay12Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeatureScreen(),
    );
  }
}

class FeatureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: [
          const SizedBox(height: 40), // For status bar space
          // Top Contact Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: AssetImage('assets/Images/baby.png'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Bella',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Add call functionality here
                  },
                  icon: Icon(Icons.call, color: Colors.red, size: 30),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Features Section
          Expanded(
            child: Column(
              children: [
                FeatureTile(
                  text: 'Use Transcription',
                  imagePath: 'assets/Images/robo.png', // Replace with your image path
                  onPressed: () {
                    print('Use Transcription Button Pressed');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Translator(),));
                    // Add navigation or functionality for Use Transcription here
                  },
                ),
                const SizedBox(height: 20),
                FeatureTile(
                  text: 'Experience Real Time',
                  imagePath: 'assets/Images/hand.png', // Replace with your image path
                  onPressed: () {
                    print('Experience Real Time Button Pressed');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Transcrip13Page(),));
                    // Add navigation or functionality for Experience Real Time here
                  },
                ),
              ],
            ),
          ),
          // Bottom Navigation Bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.phone, color: Colors.black),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CallScreen11Page(),));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message, color: Colors.black),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CallText14Page(),));
                  },
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Colors.black),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile17Page(),));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.black),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onPressed;

  const FeatureTile({
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Image.asset(
              imagePath,
              height: 50,
              width: 50,
            ), // Add images like 'assets/transcription_robot.png'
          ],
        ),
      ),
    );
  }
}
