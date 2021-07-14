import 'package:flutter/material.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF075E54),
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      title: "WhatsApp Clone",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          actions: [
            GestureDetector(child: Icon(Icons.search)),
            GestureDetector(child: Icon(Icons.more_vert)),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 2,
            tabs: [
              Container(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 8.0),
                  child: Icon(Icons.camera)),
              Container(
                padding: const EdgeInsets.only(bottom: 10.0, top: 8.0),
                child: Text(
                  "chats".toUpperCase(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10.0, top: 8.0),
                child: Text(
                  "status".toUpperCase(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10.0, top: 8.0),
                child: Text(
                  "calls".toUpperCase(),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("camera")),
            ChatsScreen(),
            Center(child: Text("status")),
            Center(child: Text("calls")),
          ],
        ),
      ),
    );
  }
}

class ChatsScreen extends StatelessWidget {
  ChatsScreen({Key? key}) : super(key: key);
  final List<String> names = [
    "Mike",
    "John",
    "Ryn",
    "Ahmed",
    "Smith",
    "Sara",
  ];
  final List<String> images = [
    "image1.jpeg",
    "image2.jpg",
    "image3.png",
    "image4.png",
    "image5.jpg",
    "image6.jpg"
  ];
  final List<String> times = [
    "Yesterday",
    "13:43",
    "01:45",
    "Today",
    "09:21",
    "Two Days ago"
  ];
  final List<String> messages = [
    "Hello there!",
    "No, I can't go",
    "Good morning!",
    "Add me on",
    "Good night",
    "Two Days ago"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        names.length,
        (index) => userSection(
          User(
              name: names[index],
              image: images[index],
              time: times[index],
              message: messages[index]),
        ),
      ),
    );
  }

  Widget userSection(User user) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage("assets/${user.image}"),
      ),
      title: Text(
        user.name!,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(user.message!),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(user.time!)],
      ),
    );
  }
}

class User {
  final String? name;
  final String? image;
  final String? time;
  final String? message;

  User({this.name, this.image, this.time, this.message});
}
