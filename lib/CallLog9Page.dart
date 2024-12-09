// import 'package:flutter/material.dart';
//
// class CallLog9Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CallsScreen(),
//     );
//   }
// }
//
// class CallsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlue,
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlue,
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: const [
//             Text(
//               'Chats',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
//             ),
//             Text(
//               'Calls',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Groups',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
//             ),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Search bar
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//             child: Row(
//               children: [
//                 Icon(Icons.search, color: Colors.black),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Search',
//                       hintStyle: TextStyle(color: Colors.black54),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Divider(color: Colors.black54, thickness: 1, indent: 16, endIndent: 16),
//           const SizedBox(height: 10),
//           // Call list
//           Expanded(
//             child: ListView(
//               children: [
//                 callItem(
//                   avatar: CircleAvatar(
//                     radius: 25,
//                     backgroundColor: Colors.yellow,
//                     child: Text(
//                       'S',
//                       style: TextStyle(fontSize: 20, color: Colors.black),
//                     ),
//                   ),
//                   name: 'Sam',
//                   time: '9:21 PM',
//                   subText: 'Mobile • Sat',
//                 ),
//                 callItem(
//                   avatar: CircleAvatar(
//                     radius: 25,
//                     backgroundColor: Colors.orange,
//                     child: Text(
//                       'S',
//                       style: TextStyle(fontSize: 20, color: Colors.black),
//                     ),
//                   ),
//                   name: 'Sanju',
//                   time: '7:42 AM',
//                   subText: 'Mobile • Mon',
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.black54,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.phone),
//             label: 'Calls',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message),
//             label: 'Messages',
//           ),
//           BottomNavigationBarItem(
//             icon: CircleAvatar(
//               backgroundColor: Colors.grey,
//               child: Icon(Icons.add, color: Colors.white),
//             ),
//             label: 'Add',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Contacts',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget callItem({
//     required Widget avatar,
//     required String name,
//     required String time,
//     required String subText,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: Row(
//         children: [
//           avatar,
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   subText,
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             time,
//             style: TextStyle(fontSize: 14, color: Colors.black54),
//           ),
//         ],
//       ),
//     );
//   }
// }