import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/Component/chat_bubble.dart';

// A simple message model
class Message {
  final String text;
  final bool isSentByMe; // true if sent by the current user

  Message({required this.text, required this.isSentByMe});
}

class MessagePage extends StatefulWidget {
  final String name;
  final String image;
  const MessagePage({super.key, required this.name, required this.image});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _messageController = TextEditingController();
  // Update the list to store Message objects instead of strings.
  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    // Add some initial messages for demonstration.
    _messages.addAll([
      Message(text: "Hi there! How are you?", isSentByMe: false),
      Message(text: "I'm good, thanks! How about you?", isSentByMe: true),
      Message(text: "Doing well! Just wanted to catch up.", isSentByMe: false),
    ]);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        // Add the user's message to the list
        _messages.add(Message(text: _messageController.text, isSentByMe: true));
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
        backgroundColor: const Color(0XFF017B6B),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.image),
            ),
            const SizedBox(width: 12),
            Text(
              widget.name,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                // Pass the sender information to your MessageBubble widget
                return MessageBubble(
                  message: _messages[index].text,
                  isSentByMe: _messages[index].isSentByMe,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0XFF017B6B)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
