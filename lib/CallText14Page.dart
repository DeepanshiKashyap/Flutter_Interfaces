// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CallText14Page(),
//     );
//   }
// }
//
// class CallText14Page extends StatelessWidget {
//   const CallText14Page({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             color: Colors.lightBlueAccent,
//           ),
//           Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(
//                     bottom: Radius.circular(20),
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     const CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage(
//                         'assets/Images/baby.png', // Replace with actual image URL
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     const Expanded(
//                       child: Text(
//                         'Bella',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.call_end,
//                         color: Colors.red,
//                       ),
//                       onPressed: () {
//                         // Add call end functionality here
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                     icon: const Icon(
//                       Icons.mic_off,
//                       size: 30,
//                     ),
//                     onPressed: () {
//                       // Add mic mute functionality here
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(
//                       Icons.text_fields,
//                       size: 30,
//                     ),
//                     onPressed: () {
//                       // Add text functionality here
//                     },
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               Expanded(
//                 child: ListView(
//                   padding: const EdgeInsets.all(16.0),
//                   children: const [
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: ChatBubble(
//                         text: 'Hey',
//                         color: Colors.greenAccent,
//                         alignment: CrossAxisAlignment.end,
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: ChatBubble(
//                         text: 'Hi, Bella',
//                         color: Colors.grey,
//                         alignment: CrossAxisAlignment.start,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 color: Colors.grey[200],
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.volume_up),
//                     const SizedBox(width: 8),
//                     const Icon(Icons.mic_off),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: TextField(
//                         decoration: const InputDecoration(
//                           hintText: 'Type a message',
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     const Icon(Icons.language),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ChatBubble extends StatelessWidget {
//   final String text;
//   final Color color;
//   final CrossAxisAlignment alignment;
//
//   const ChatBubble({
//     Key? key,
//     required this.text,
//     required this.color,
//     required this.alignment,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 5),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(fontSize: 16),
//       ),
//     );
//   }
// }
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
      home: CallText14Page(),
    );
  }
}

class CallText14Page extends StatefulWidget {
  const CallText14Page({Key? key}) : super(key: key);

  @override
  _CallText14PageState createState() => _CallText14PageState();
}

class _CallText14PageState extends State<CallText14Page> {
  late IO.Socket socket;
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final String _username = "User1";
  final String _room = "1";
  final String _sendLang = "en";
  final String _receiveLang = "hi";

  @override
  void initState() {
    super.initState();
    _initializeSocket();
  }

  void _initializeSocket() {
    socket = IO.io(
      'http://192.168.217.127:5000', // Replace with your Flask server's address
      IO.OptionBuilder()
          .setTransports(['websocket']) // Use WebSocket for communication
          .setQuery({'username': _username, 'room': _room})
          .build(),

    );

    socket.onConnect((_) {
      print('Connected to server');
      socket.emit('join', {'username': _username, 'room': _room});
    });

    socket.on('message', (data) {
      setState(() {
        _messages.add(data);
      });
    });

    socket.onDisconnect((_) => print('Disconnected from server'));
    print("heeelo");

  }
  void _sendMessage(String message, String type) {
    if (message.isNotEmpty) {
      socket.emit('message', {
        'sender': _username,
        'room': _room,
        'message': message,
        'type': type,
        'sendLanguage': _sendLang,
        'receiveLanguage': _receiveLang,
      });
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.lightBlueAccent),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/Images/baby.png'),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Bella',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.call_end,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        socket.emit('leave', {'username': _username, 'room': _room});
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    final isSender = message['sender'] == _username;
                    final alignment = isSender
                        ? Alignment.centerRight
                        : Alignment.centerLeft;
                    final bubbleColor = isSender
                        ? Colors.greenAccent
                        : Colors.grey;

                    if (message['type'] == 'text') {
                      return Align(
                        alignment: alignment,
                        child: ChatBubble(
                          text: message['message'],
                          color: bubbleColor,
                        ),
                      );
                    } else if (message['type'] == 'voice') {
                      return Align(
                        alignment: alignment,
                        child: ChatBubble(
                          text: "Voice message received",
                          color: bubbleColor,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: () {
                        // Add voice recording and send functionality
                        _sendMessage("Voice data", "voice");
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'Type a message',
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {
                          _sendMessage(value, "text");
                          print(value);
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        _sendMessage(_messageController.text, "text");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final Color color;

  const ChatBubble({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}