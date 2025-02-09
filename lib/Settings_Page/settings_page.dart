import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/Models/settings_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<SettingsModel> settingsOptions = [
    SettingsModel(
      icon: Icons.security,
      title: "Account",
      subtitle: "Security notifications, change number",
    ),
    SettingsModel(
        icon: Icons.lock,
        title: "Privacy",
        subtitle: "Block contacts, disappearing messages"),
    SettingsModel(
        icon: Icons.person,
        title: "Avatar",
        subtitle: "Create, edit, profile photo"),
    SettingsModel(
      icon: Icons.notifications,
      title: "Notifications",
      subtitle: "Message, group & call tones",
    ),
    SettingsModel(
      icon: Icons.storage,
      title: "Storage",
      subtitle: "Network usage, auto-download",
    ),
    SettingsModel(
      icon: Icons.language,
      title: "App language",
      subtitle: "English (device's language)",
    ),
    SettingsModel(
      icon: Icons.help,
      title: "Help",
      subtitle: "Help center, contact us, privacy policy",
    ),
    SettingsModel(
      icon: Icons.group,
      title: "Invite a friend",
      subtitle: "",
    )
  ];

  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: const Color(0XFF017B6B),
        title: _isSearching
            ? _buildSearchField()
            : Text(
                'Settings',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  // You might want to reset the list to its original state here
                }
              });
            },
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                            radius: 23,
                            backgroundImage: NetworkImage(
                                'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg') // Replace with your image
                            ),
                        const SizedBox(width: 16),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Michael",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Doctor",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.qr_code,
                              color: Color(0XFF017B6B),
                            )),
                        IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0XFF017B6B),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: settingsOptions.length,
                      itemBuilder: (context, index) {
                        final setting = settingsOptions[index];
                        if (_isSearching &&
                            !setting.title.toLowerCase().contains(
                                _searchController.text.toLowerCase()) &&
                            !setting.subtitle.toLowerCase().contains(
                                _searchController.text.toLowerCase())) {
                          return const SizedBox.shrink();
                        }

                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: ListTile(
                            leading: Icon(
                              setting.icon,
                              color: Color(0XFF017B6B),
                              size: 30,
                            ),
                            title: Text(
                              setting.title,
                              style: GoogleFonts.poppins(),
                            ),
                            subtitle: setting.subtitle.isNotEmpty
                                ? Text(
                                    setting.subtitle,
                                    style: GoogleFonts.poppins(),
                                  )
                                : null,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                Text(
                  "from",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  "F A C E B O O K",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "Search...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white70),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) {
        setState(() {});
      },
    );
  }
}
