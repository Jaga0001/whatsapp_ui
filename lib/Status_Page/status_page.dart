import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Models/status_model.dart';

class StatusPage extends StatefulWidget {
  final String searchText;

  const StatusPage({Key? key, required this.searchText}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final List<StatusModel> allStatuses = [
    StatusModel(
        name: 'Peter',
        time: '09:00 PM',
        image:
            'https://cdn.pixabay.com/photo/2023/04/28/23/32/ai-generated-7957457_1280.png'),
    StatusModel(
        name: 'Joe',
        time: '10:30 PM',
        image:
            'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg'),
    StatusModel(
        name: 'Fernandes',
        time: '11:00 PM',
        image:
            'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/3658a1f5-7077-4e2e-bffc-bac4e2343f05/a56f54e4-6728-43dc-85dc-cb50bfc75ebe.png'),
    StatusModel(
        name: 'Paul',
        time: '12:00 AM',
        image:
            'https://cgfaces.com/collection/preview/0f3e1b79-d4f5-4d1f-81ce-a70fb0cef7a2.jpg'),
    StatusModel(
        name: 'John',
        time: '06:00 AM',
        image:
            'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/3658a1f5-7077-4e2e-bffc-bac4e2343f05/a56f54e4-6728-43dc-85dc-cb50bfc75ebe.png'),
    StatusModel(
        name: 'Joseph',
        time: '09:00 AM',
        image:
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/drop-of-water-736885__480.jpg'),
  ];

  List<StatusModel> filteredStatuses = [];

  @override
  void initState() {
    super.initState();
    _filterStatuses();
  }

  @override
  void didUpdateWidget(covariant StatusPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchText != widget.searchText) {
      _filterStatuses();
    }
  }

  void _filterStatuses() {
    setState(() {
      if (widget.searchText.isEmpty) {
        filteredStatuses = List.from(allStatuses);
      } else {
        filteredStatuses = allStatuses
            .where((status) => status.name
                .toLowerCase()
                .contains(widget.searchText.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.grey[400],
              onPressed: () {},
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {},
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  title: const Text(
                    'My Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: const Text(
                    'Tap to add status update',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  leading: Container(
                    height: 50, // Increased from 60
                    width: 50, // Increased from 60
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 40, // Increased from 30
                      backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                      ),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.more_horiz,
                    color: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: const [
                    Text(
                      'Recent updates',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: filteredStatuses.length,
                      itemBuilder: (context, index) {
                        final StatusModel status = filteredStatuses[index];
                        return ListTile(
                          leading: Container(
                            height: 50, // Increased from 60
                            width: 50, // Increased from 60
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 40, // Increased from 30
                              backgroundImage: NetworkImage(status.image),
                            ),
                          ),
                          title: Text(
                            status.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            'Today, ${status.time}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        );
                      })),
            ],
          ),
        ));
  }
}
