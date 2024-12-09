// import 'package:flutter/material.dart';
//
// class Friend9Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CallsScreen(),
//     );
//   }
// }
//
// class CallsScreen extends StatefulWidget {
//   @override
//   _CallsScreenState createState() => _CallsScreenState();
// }
//
// class _CallsScreenState extends State<CallsScreen> {
//   final List<Map<String, String>> calls = [
//     {"name": "Bella", "time": "6:13 AM", "day": "Sun"},
//     {"name": "John", "time": "11:51 PM", "day": "Sat"},
//     {"name": "Sam", "time": "9:21 PM", "day": "Sat"},
//     {"name": "Ella", "time": "7:42 AM", "day": "Mon"},
//     {"name": "Rogger", "time": "7:42 AM", "day": "Mon"},
//   ];
//
//   bool _isSearching = false; // To toggle between search and normal state
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlue,
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Chats", style: TextStyle(color: Colors.black54)),
//             Text("Calls", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//             Text("Groups", style: TextStyle(color: Colors.black54)),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: Colors.lightBlue,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.search, color: Colors.black),
//                     onPressed: () {
//                       setState(() {
//                         _isSearching = true;
//                       });
//                       _focusNode.requestFocus(); // Focus on the text field
//                     },
//                   ),
//                   Expanded(
//                     child: _isSearching
//                         ? TextField(
//                       controller: _searchController,
//                       focusNode: _focusNode,
//                       decoration: InputDecoration(
//                         hintText: "Search...",
//                         border: InputBorder.none,
//                       ),
//                       onChanged: (value) {
//                         // Handle search logic here
//                       },
//                     )
//                         : Divider(color: Colors.black, thickness: 1),
//                   ),
//                   if (_isSearching)
//                     IconButton(
//                       icon: Icon(Icons.close, color: Colors.black),
//                       onPressed: () {
//                         setState(() {
//                           _isSearching = false;
//                           _searchController.clear();
//                         });
//                         _focusNode.unfocus(); // Close the keyboard
//                       },
//                     ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: calls.length,
//               itemBuilder: (context, index) {
//                 final call = calls[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     child: Text(call["name"]![0]),
//                   ),
//                   title: Text(call["name"]!),
//                   subtitle: Text("Mobile.${call["day"]}"),
//                   trailing: Text(call["time"]!),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.call),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }