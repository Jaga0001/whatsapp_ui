import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Models/calls_model.dart';

class CallPage extends StatefulWidget {
  final String searchText;

  const CallPage({Key? key, required this.searchText}) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final List<CallsModel> allCalls = [
    CallsModel(
      image:
          'https://th.bing.com/th/id/OIP.i9tgTvW8-5xhrPhsAUedOQHaFm?rs=1&pid=ImgDetMain',
      name: "Martin Torff",
      time: "5 minutes ago",
      videocall: true,
      ismissed: false,
    ),
    CallsModel(
      image:
          'https://th.bing.com/th/id/OIP.4Py7MYDlJMhMjiA_gELNdAHaGh?rs=1&pid=ImgDetMain',
      name: "Alfonso Rhiel Madsen",
      time: "7 minutes ago",
      videocall: true,
      ismissed: true,
    ),
    CallsModel(
      image:
          'https://th.bing.com/th/id/OIP.2v2nrqGmE9RT8xf-WbY-QwHaGt?rs=1&pid=ImgDetMain',
      name: "Carla Korsgaard",
      time: "10 minutes ago",
      videocall: true,
      ismissed: true,
    ),
    CallsModel(
      image:
          'https://th.bing.com/th/id/OIP.ueWoSOP2NBNORHxxLiuXxQHaHa?w=150&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7',
      name: "Cristofer Passaquindici Arcand",
      time: "12 minutes ago",
      videocall: false,
      ismissed: false,
    ),
    CallsModel(
      image:
          'https://cdn.pixabay.com/photo/2023/04/28/23/32/ai-generated-7957457_1280.png',
      name: "Zaire Passaquindici Arcand",
      time: "15 minutes ago",
      videocall: true,
      ismissed: true,
    ),
    CallsModel(
      image:
          'https://th.bing.com/th/id/OIP.RczLHpGhBtKxRuaNCKv_KQHaGU?rs=1&pid=ImgDetMain',
      name: "Martin Dorwart",
      time: "16 minutes ago",
      videocall: true,
      ismissed: true,
    ),
    CallsModel(
      image:
          'https://th.bing.com/th/id/OIP.fAgD2v3r1QUsJCLHhjWqCQHaHa?rs=1&pid=ImgDetMain',
      name: "Phillip Westervelt",
      time: "18 minutes ago",
      videocall: true,
      ismissed: true,
    ),
    CallsModel(
      image:
          'https://th.bing.com/th/id/OIP.7rsD5RX9MBDOObi-Pa7fWgHaHa?w=640&h=640&rs=1&pid=ImgDetMain',
      name: "Terry Dokidis",
      time: "20 minutes ago",
      videocall: false,
      ismissed: false,
    ),
    CallsModel(
      image:
          'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg',
      name: "Wesley Rice",
      time: "16 minutes ago",
      videocall: true,
      ismissed: true,
    ),
    CallsModel(
      image:
          'https://th.bing.com/th/id/OIP.i9tgTvW8-5xhrPhsAUedOQHaFm?rs=1&pid=ImgDetMain',
      name: "Elliana McIntosh",
      time: "18 minutes ago",
      videocall: true,
      ismissed: true,
    ),
    CallsModel(
      image:
          'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/3658a1f5-7077-4e2e-bffc-bac4e2343f05/a56f54e4-6728-43dc-85dc-cb50bfc75ebe.png',
      name: "Carolyn Pena",
      time: "20 minutes ago",
      videocall: false,
      ismissed: false,
    ),
  ];

  List<CallsModel> filteredCalls = [];

  @override
  void initState() {
    super.initState();
    _filterCalls();
  }

  @override
  void didUpdateWidget(covariant CallPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchText != widget.searchText) {
      _filterCalls();
    }
  }

  void _filterCalls() {
    setState(() {
      if (widget.searchText.isEmpty) {
        filteredCalls = List.from(allCalls);
      } else {
        filteredCalls = allCalls
            .where((call) => call.name
                .toLowerCase()
                .contains(widget.searchText.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0XFF017B6B),
              child: Icon(
                Icons.link,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create call link",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'Share a link for your whatsapp calls',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: filteredCalls.length,
        itemBuilder: (context, index) {
          final call = filteredCalls[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(call.image),
            ),
            title: Text(
              call.name,
              style: TextStyle(
                color: call.ismissed ? Colors.red : Colors.black,
                fontWeight: call.ismissed ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(
                  call.ismissed ? Icons.call_missed : Icons.call_received,
                  color: call.ismissed ? Colors.red : Colors.green,
                ),
                SizedBox(width: 5),
                Text(
                  call.time,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            trailing: Icon(
              call.videocall ? Icons.videocam : Icons.call,
              color: Colors.teal,
              size: 20,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_call,
          color: Colors.white,
        ),
        backgroundColor: Color(0XFF017B6B),
      ),
    );
  }
}
