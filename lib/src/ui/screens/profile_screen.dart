import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://via.placeholder.com/150"),
          ),
          SizedBox(height: 16),
          Text(
            "mika",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "wangmikayi@gmail.com",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: null,
            // onPressed: () {
            //   // Navigate to language selection screen
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(builder: (context) => LanguageSelectionScreen()),
            //   // );
            // },
            child: Text('Change Language'),
          ),
        ],
      ),
    ));
  }
}
