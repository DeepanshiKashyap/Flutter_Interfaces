import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late IO.Socket socket;
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  String room = "general"; // Default room
  String username = "User1"; // Replace with dynamic username if needed

  @override
  void initState() {
    super.initState();
    // Initialize the socket connection
    socket = IO.io(
      'http://127.0.0.1:5000', // Replace with your Flask backend URL
      IO.OptionBuilder()
          .setTransports(['websocket']) // Use WebSocket transport
          .setExtraHeaders({'username': username}) // Add optional headers
          .build(),
    );

    // Connect to the server
    socket.connect();

    // Handle connection
    socket.onConnect((_) {
      print('Connected to the server');
      joinRoom();
    });

    // Listen for messages
    socket.on('message', (data) {
      setState(() {
        _messages.add({
          'sender': data['sender'],
          'message': data['message'],
        });
      });
    });

    // Handle disconnect
    socket.onDisconnect((_) => print('Disconnected from server'));
  }

  void joinRoom() {
    socket.emit('join', {
      'username': username,
      'room': room,
    });
  }

  void sendMessage(String message) {
    socket.emit('message', {
      'sender': username,
      'room': room,
      'type': 'text',
      'message': message,
      'sendLanguage': 'en', // Change to dynamic language if needed
      'receiveLanguage': 'hi', // Change to dynamic language if needed
    });
    _messageController.clear();
  }

  @override
  void dispose() {
    socket.emit('leave', {'username': username, 'room': room});
    socket.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Room: $room'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isMe = msg['sender'] == username;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${msg['sender']}: ${msg['message']}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      sendMessage(_messageController.text);
                    }
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