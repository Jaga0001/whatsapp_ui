import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Splash_Screen_Page/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp UI',
      home: SplashScreen(),
    );
  }
}
