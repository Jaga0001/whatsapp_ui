import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Full_Screen_Image_Page/Full_Screen_Image_Page.dart';
import 'package:whatsapp_ui/Message_Page/message_page.dart';
import 'package:whatsapp_ui/Models/user_model.dart';

class ChatPage extends StatefulWidget {
  final String searchText;

  const ChatPage({Key? key, required this.searchText}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Usermodel> Users = [
    Usermodel(
        UserName: 'Peter',
        UserDesc: 'I am a Lead',
        UserImage:
            'https://cdn.pixabay.com/photo/2023/04/28/23/32/ai-generated-7957457_1280.png',
        time: '09:00 PM',
        color: Colors.blue,
        icon: Icon(Icons.done_all)),
    Usermodel(
        UserName: 'Joe',
        UserDesc: 'I am in Outside',
        UserImage:
            'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg',
        time: '10:30 PM',
        color: Colors.grey,
        icon: Icon(Icons.done_all)),
    Usermodel(
        UserName: 'Fernandes',
        UserDesc: 'I am Waiting',
        UserImage:
            'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/3658a1f5-7077-4e2e-bffc-bac4e2343f05/a56f54e4-6728-43dc-85dc-cb50bfc75ebe.png',
        time: '11:00 PM',
        color: Colors.grey,
        icon: Icon(Icons.check_rounded)),
    Usermodel(
        UserName: 'Paul',
        UserDesc: "Let's we start",
        UserImage:
            'https://cgfaces.com/collection/preview/0f3e1b79-d4f5-4d1f-81ce-a70fb0cef7a2.jpg',
        time: '12:00 AM',
        color: Colors.blue,
        icon: Icon(Icons.done_all)),
    Usermodel(
        UserName: 'John',
        UserDesc: 'Never Give Up',
        UserImage:
            'https://th.bing.com/th/id/OIP.7rsD5RX9MBDOObi-Pa7fWgHaHa?w=640&h=640&rs=1&pid=ImgDetMain',
        time: '06:00 AM',
        color: Colors.blue,
        icon: Icon(Icons.done_all)),
    Usermodel(
        UserName: 'Joseph',
        UserDesc: 'I will come',
        UserImage:
            'https://th.bing.com/th/id/OIP.uSnLGgyZVhjA97xi-OVcggHaHa?w=1200&h=1200&rs=1&pid=ImgDetMain',
        time: '09:00 AM',
        color: Colors.grey,
        icon: Icon(Icons.done_all)),
    Usermodel(
        UserName: 'Leo',
        UserDesc: 'Hi',
        UserImage:
            'https://static.vecteezy.com/system/resources/previews/031/719/847/large_2x/ai-generated-studio-portrait-of-handsome-indian-man-on-colour-background-photo.jpg',
        time: '10:00 AM',
        color: Colors.blue,
        icon: Icon(Icons.done_all)),
    Usermodel(
        UserName: 'Berlin',
        UserDesc: 'Go',
        UserImage:
            'https://th.bing.com/th/id/OIP.nfNSIIzxQDo2MgmWay7GDwAAAA?w=121&h=182&c=7&r=0&o=5&dpr=1.3&pid=1.7',
        time: '10:10 AM',
        color: Colors.grey,
        icon: Icon(Icons.check_rounded)),
    Usermodel(
        UserName: 'Antony',
        UserDesc: 'Hello',
        UserImage:
            'https://th.bing.com/th/id/OIP.KMOklfHCb9aqonea_tAYrgHaJn?w=985&h=1280&rs=1&pid=ImgDetMain',
        time: '11:00 AM',
        color: Colors.grey,
        icon: Icon(Icons.check_rounded)),
    Usermodel(
        UserName: 'Samson',
        UserDesc: 'Welcome',
        UserImage:
            'https://thumbs.dreamstime.com/b/photo-realistic-digital-collage-confident-businessman-generated-artificial-face-asian-ethnicity-standing-against-grey-249877767.jpg',
        time: '12:00 PM',
        color: Colors.blue,
        icon: Icon(Icons.done_all)),
    Usermodel(
        UserName: 'Harry',
        UserDesc: 'You come to Hawkwarts',
        UserImage:
            'https://images.squarespace-cdn.com/content/51b3dc8ee4b051b96ceb10de/1372481512235-MLENBZ6M35ZONDMGBRWL/HarryPotterPromoPic1.jpg?format=1000w&content-type=image%2Fjpeg',
        time: '09:00 PM',
        color: Colors.grey,
        icon: Icon(Icons.done_all)),
    Usermodel(
        UserName: 'Ronnie',
        UserDesc: 'I am in Home',
        UserImage:
            'https://th.bing.com/th/id/OIP.ldun9nlPmfdjhi1epE10RQHaFj?w=212&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
        time: '09:00 PM',
        color: Colors.blue,
        icon: Icon(Icons.done_all)),
  ];

  List<Usermodel> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _filterUsers();
  }

  @override
  void didUpdateWidget(covariant ChatPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchText != oldWidget.searchText) {
      _filterUsers();
    }
  }

  // Function to filter users based on search query
  void _filterUsers() {
    String query = widget.searchText.toLowerCase();
    setState(() {
      filteredUsers = Users.where((user) =>
          user.UserName!.toLowerCase().contains(query) ||
          user.UserDesc!.toLowerCase().contains(query)).toList();
    });
  }

  void _showFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImagePage(imageUrl: imageUrl),
      ),
    ).then((_) {
      setState(() {
        // You can add code here to refresh the ChatPage if needed.
        // For example, re-filter the users:
        _filterUsers();
      });
    });
  }

  void _showProfileImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              _showFullScreenImage(
                  context, imageUrl); // Show full screen on tap
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final User = filteredUsers[index];
                return Column(
                  children: [
                    ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessagePage(
                            name: User.UserName!,
                            image: User.UserImage!,
                          ),
                        ),
                      ),
                      title: Text(
                        User.UserName!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      trailing: Text(User.time!),
                      leading: GestureDetector(
                        onTap: () {
                          _showProfileImage(context, User.UserImage!);
                        },
                        child: CircleAvatar(
                          radius: 23,
                          backgroundImage: NetworkImage(User.UserImage!),
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(
                            User.icon!.icon,
                            color: User.color,
                            size: 14,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Expanded(
                            child: Text(
                              User.UserDesc!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF017B6B),
        onPressed: () {
          // Implement action for the floating button
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
    );
  }
}
