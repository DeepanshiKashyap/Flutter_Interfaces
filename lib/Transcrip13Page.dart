import 'package:flutter/material.dart';
import 'package:sih_main_page/CallText14Page.dart';
import 'package:sih_main_page/Normalcall15Page.dart';
import 'package:sih_main_page/Profile17Page.dart';

import 'CallScreen11Page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Transcrip13Page(),
    );
  }
}

class Transcrip13Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: [
          // Top Section with Contact Info
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/Images/baby.png'),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Bella',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Center Section with Transcription
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.android,
                          color: Colors.lightBlue,
                          size: 50,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Use Transcription',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Normalcall15Page(),));
                        },
                        icon: Icon(Icons.mic, size: 40, color: Colors.black),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CallText14Page(),));
                        },
                        icon: Icon(Icons.text_fields, size: 40, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
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