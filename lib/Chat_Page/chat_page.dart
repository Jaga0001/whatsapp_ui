import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Models/user_model.dart';

class MyContacts extends StatefulWidget {
  const MyContacts({super.key});

  @override
  State<MyContacts> createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  List<Usermodel> Users = [
    Usermodel(
      UserName: 'Peter',
      UserDesc: 'I am a Lead',
      UserImage:
          'https://cdn.pixabay.com/photo/2023/04/28/23/32/ai-generated-7957457_1280.png',
      time: '09:00 PM',
    ),
    Usermodel(
      UserName: 'Joe',
      UserDesc: 'I am in Outside',
      UserImage:
          'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg',
      time: '10:30 PM',
    ),
    Usermodel(
      UserName: 'Fernandes',
      UserDesc: 'I am Waiting',
      UserImage:
          'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/3658a1f5-7077-4e2e-bffc-bac4e2343f05/a56f54e4-6728-43dc-85dc-cb50bfc75ebe.png',
      time: '11:00 PM',
    ),
    Usermodel(
      UserName: 'Paul',
      UserDesc: "Let's we start",
      UserImage:
          'https://cgfaces.com/collection/preview/0f3e1b79-d4f5-4d1f-81ce-a70fb0cef7a2.jpg',
      time: '12:00 AM',
    ),
    Usermodel(
      UserName: 'John',
      UserDesc: 'Never Give Up',
      UserImage:
          'https://img.freepik.com/premium-photo/man-blue-shirt-tie-looking-camera-with-blue-background_746565-191379.jpg',
      time: '06:00 AM',
    ),
    Usermodel(
      UserName: 'Joseph',
      UserDesc: 'I will come',
      UserImage:
          'https://img.freepik.com/premium-photo/man-blue-shirt-tie-looking-camera-with-blue-background_746565-191442.jpg',
      time: '09:00 AM',
    ),
    Usermodel(
      UserName: 'Leo',
      UserDesc: 'Hi',
      UserImage:
          'https://static.vecteezy.com/system/resources/previews/031/719/847/large_2x/ai-generated-studio-portrait-of-handsome-indian-man-on-colour-background-photo.jpg',
      time: '10:00 AM',
    ),
    Usermodel(
      UserName: 'Berlin',
      UserDesc: 'Go',
      UserImage:
          'https://images.ladbible.com/resize?type=webp&quality=70&width=3840&fit=contain&gravity=auto&url=https://images.ladbiblegroup.com/v3/assets/bltcd74acc1d0a99f3a/blt7dc715fcd9324509/64b1609273ef23488c840278/exeter-ai.png',
      time: '10:10 AM',
    ),
    Usermodel(
      UserName: 'Antony',
      UserDesc: 'Hello',
      UserImage:
          'https://r2.starryai.com/results/1006388789/4734eadc-14f3-433f-9d6f-c2b3ac2abbeb.webp',
      time: '11:00 AM',
    ),
    Usermodel(
      UserName: 'Samson',
      UserDesc: 'Welcome',
      UserImage:
          'https://images.ladbible.com/resize?type=jpeg&quality=70&width=648&fit=contain&gravity=null&url=https://images.ladbiblegroup.com/v3/assets/blt949ea8e16e463049/blt2daac7e636047210/649dbcaf499ee54dd40f3b2c/most-attractive-man-in-a-country-v0-04ao5zjkat8b1.jpg.webp',
      time: '12:00 PM',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Users.length,
        itemBuilder: (context, index) {
          final User = Users[index];
          return Container(
            height: 74,
            child: ListTile(
              title: Text(
                User.UserName!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Text(User.time!),
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(User.UserImage!),
              ),
              subtitle: Text(User.UserDesc!),
            ),
          );
        });
  }
}
