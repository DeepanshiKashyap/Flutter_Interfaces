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
      home: SocketIoExample(),
    );
  }
}

class SocketIoExample extends StatefulWidget {
  @override
  _SocketIoExampleState createState() => _SocketIoExampleState();
}

class _SocketIoExampleState extends State<SocketIoExample> {
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    // Initialize the socket connection
    socket = IO.io(
      'http://192.168.217.127:5000', // Replace with your Flask backend URL
      IO.OptionBuilder()
          .setTransports(['websocket']) // Use WebSocket transport
          .disableAutoConnect() // Disable automatic connection
          .build(),
    );

    // Connect to the server
    socket.connect();

    // Listen for events
    socket.onConnect((_) {
      print('Connected to server');
    });

    socket.on('message', (data) {
      print('Message received: $data');
    });

    socket.onDisconnect((_) => print('Disconnected from server'));
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Socket.IO Client Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            socket.emit('message', {'content': 'Hello, Server!'});
          },
          child: const Text('Send Message'),
        ),
      ),
    );
  }
}