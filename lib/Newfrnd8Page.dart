import 'package:flutter/material.dart';
import 'package:sih_main_page/CallScreen11Page.dart';
import 'package:sih_main_page/Friend9Page.dart';


class Newfrnd8Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find New Friends',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Find new friends\n closer than ever'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search friends',

                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _featureCard('Translation', Icons.translate),
                    _featureCard('Real Time', Icons.wifi_tethering),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Learn XYZ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      'assets/Images/women.png', // Replace with your image path
                      height: 150,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>CallScreen11Page(),));
                      },
                      child: Text('Open'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Call',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureCard(String title, IconData icon) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }
}
