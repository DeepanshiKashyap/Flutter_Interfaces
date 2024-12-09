import 'package:flutter/material.dart';
import 'package:sih_main_page/CallText14Page.dart';
import 'package:sih_main_page/Profile17Page.dart';
import 'package:sih_main_page/SelectWay12Page.dart';

class CallScreen11Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DynamicSearchScreen(),
    );
  }
}

class DynamicSearchScreen extends StatefulWidget {
  @override
  _DynamicSearchScreenState createState() => _DynamicSearchScreenState();
}

class _DynamicSearchScreenState extends State<DynamicSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isSearchingNumber = false;

  final List<Map<String, String>> callLogs = [
    {"name": "Bella", "number": "7893129543", "time": "6:13 AM", "day": "Sun"},
    {"name": "John", "number": "9876543210", "time": "11:51 PM", "day": "Sat"},
    {"name": "Sam", "number": "8765432109", "time": "9:21 PM", "day": "Sat"},
    {"name": "Ella", "number": "7654321098", "time": "7:42 AM", "day": "Mon"},
    {"name": "Rogger", "number": "6543210987", "time": "7:42 AM", "day": "Mon"},
  ];

  List<Map<String, String>> _filteredResults = [];

  @override
  void initState() {
    super.initState();
    _filteredResults = callLogs; // Show all results initially
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _isSearchingNumber = int.tryParse(query) != null; // Check if it's a number
      _filteredResults = _isSearchingNumber
          ? callLogs.where((call) => call["number"]!.contains(query)).toList()
          : callLogs.where((call) => call["name"]!.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Chats',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            Text(
              'Calls',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Groups',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search bar with IconButton
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.black),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    keyboardType: TextInputType.text, // Allows both names and numbers
                    decoration: InputDecoration(
                      hintText: 'Search by name or number',
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.black),
                  onPressed: () {
                    // Add your custom functionality here
                    print("Search settings pressed!");
                  },
                ),
              ],
            ),
          ),
          Divider(color: Colors.black54, thickness: 1, indent: 16, endIndent: 16),
          const SizedBox(height: 10),

          // Conditional UI rendering
          Expanded(
            child: _isSearchingNumber ? _buildNumberSearchUI() : _buildCallList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Add your custom functionality for Calls
                print("Calls icon pressed!");
              },
              child: Icon(Icons.phone),
            ),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Add your custom functionality for Messages
                print("Messages icon pressed!");
                Navigator.push(context, MaterialPageRoute(builder: (Context)=>CallText14Page(),));
              },
              child: Icon(Icons.message),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectWay12Page(),));
                print("Add icon pressed!");
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Add your custom functionality for Contacts
                print("Contacts icon pressed!");
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile17Page(),));
              },
              child: Icon(Icons.person),
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Add your custom functionality for Settings
                print("Settings icon pressed!");
              },
              child: Icon(Icons.settings),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildCallList() {
    return ListView.builder(
      itemCount: _filteredResults.length,
      itemBuilder: (context, index) {
        final call = _filteredResults[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(call["name"]![0]),
          ),
          title: Text(call["name"]!),
          subtitle: Text("Mobile.${call["day"]}"),
          trailing: Text(call["time"]!),
        );
      },
    );
  }

  Widget _buildNumberSearchUI() {
    return ListView.builder(
      itemCount: _filteredResults.length,
      itemBuilder: (context, index) {
        final contact = _filteredResults[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Text(contact["name"]![0]),
          ),
          title: Text(contact["name"]!),
          subtitle: Text(contact["number"]!),
        );
      },
    );
  }
}