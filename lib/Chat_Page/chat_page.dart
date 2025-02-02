import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Models/user_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Users.length,
              itemBuilder: (context, index) {
                final User = Users[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        User.UserName!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      trailing: Text(User.time!),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(User.UserImage!),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(
                            User.icon!.icon,
                            color: User.color,
                            size: 16,
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
