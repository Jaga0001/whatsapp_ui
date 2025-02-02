import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Message_Page/message_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp UI',
      home: MessagePage(
        name: 'Peter',
        image:
            'https://cdn.pixabay.com/photo/2023/04/28/23/32/ai-generated-7957457_1280.png',
      ),
    );
  }
}
