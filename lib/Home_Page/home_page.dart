import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/Chat_Page/chat_page.dart';
import 'package:whatsapp_ui/Status_Page/status_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF017B6B),
          title: Text(
            'WhatsApp',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
          ),
          actions: [
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.camera_alt),
              onPressed: () {},
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  'CHATS',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'STATUS',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'CALLS',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatPage(),
            StatusPage(),
            Center(
              child: Text('Calls'),
            ),
          ],
        ),
      ),
    );
  }
}
