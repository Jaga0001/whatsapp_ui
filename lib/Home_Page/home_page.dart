import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/Call_Page/call_page.dart';
import 'package:whatsapp_ui/Chat_Page/chat_page.dart';
import 'package:whatsapp_ui/Link_Devices_Page/link_devices_page.dart';
import 'package:whatsapp_ui/Payment_Page/payment_page.dart';
import 'package:whatsapp_ui/Settings_Page/settings_page.dart';
import 'package:whatsapp_ui/Status_Page/status_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  List<String> allChats = [
    "John Doe",
    "Jane Smith",
    "Alice Bob",
    "Bob Charlie",
    "Eve Johnson"
  ];

  List<String> filteredChats = [];

  @override
  void initState() {
    super.initState();
    filteredChats = List.from(allChats);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _updateSearch() {
    setState(() {
      _searchText = _searchController.text;
      if (_searchText.isEmpty) {
        filteredChats = List.from(allChats);
      } else {
        filteredChats = allChats
            .where((chat) =>
                chat.toLowerCase().contains(_searchText.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF017B6B),
          title: _isSearching
              ? TextField(
                  controller: _searchController,
                  autofocus: true,
                  style: GoogleFonts.poppins(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: GoogleFonts.poppins(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    //Implement your Search Logic
                    _updateSearch();
                  },
                )
              : Text(
                  'WhatsApp',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white),
                ),
          actions: [
            if (!_isSearching)
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.camera_alt),
                onPressed: () {},
              ),
            IconButton(
              color: Colors.white,
              icon: Icon(_isSearching ? Icons.close : Icons.search),
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                  if (!_isSearching) {
                    _searchController.clear();
                    _updateSearch();
                  }
                });
              },
            ),
            if (!_isSearching)
              PopupMenuButton<String>(
                position: PopupMenuPosition.under,
                color: Color(0XFF017B6B),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust radius as needed
                ),
                onSelected: (String item) {
                  print('Selected: $item');

                  switch (item) {
                    case 'New group':
                      break;
                    case 'New broadcast':
                      break;
                    case 'Linked devices':
                      break;
                    case 'Starred messages':
                      break;
                    case 'Payments':
                      break;
                    case 'Settings':
                      break;
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      onTap: () {},
                      value: 'New group',
                      child: Text('New group',
                          style: GoogleFonts.poppins(color: Colors.white)),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {},
                      value: 'New broadcast',
                      child: Text('New broadcast',
                          style: GoogleFonts.poppins(color: Colors.white)),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LinkDevicesPage()));
                      },
                      value: 'Linked devices',
                      child: Text('Linked devices',
                          style: GoogleFonts.poppins(color: Colors.white)),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {},
                      value: 'Starred messages',
                      child: Text('Starred messages',
                          style: GoogleFonts.poppins(color: Colors.white)),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentPage()));
                      },
                      value: 'Payments',
                      child: Text('Payments',
                          style: GoogleFonts.poppins(color: Colors.white)),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()));
                      },
                      value: 'Settings',
                      child: Text('Settings',
                          style: GoogleFonts.poppins(color: Colors.white)),
                    ),
                  ];
                },
                icon: Icon(Icons.more_vert, color: Colors.white), // Moved here
              ),
          ],
          bottom: _isSearching
              ? null
              : TabBar(
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
            ChatPage(
              searchText: _searchText,
            ),
            StatusPage(
              searchText: _searchText,
            ),
            CallPage(
              searchText: _searchText,
            )
          ],
        ),
      ),
    );
  }
}
