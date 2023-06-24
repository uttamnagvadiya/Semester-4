import 'package:flutter/material.dart';

class Kishan extends StatefulWidget {
  const Kishan({Key? key}) : super(key: key);

  @override
  State<Kishan> createState() => _KishanState();
}

class _KishanState extends State<Kishan> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> iconList = [
      {
        'icon': "assets/demo_icon/atandt.png",
        'color': Colors.blue,
        'bg-color': Colors.blue.shade100
      },
      {
        'icon': "assets/demo_icon/bank.png",
        'color': Colors.amber,
        'bg-color': Colors.yellow.shade100
      },
      {
        'icon': "assets/demo_icon/delete.png",
        'color': Colors.red,
        'bg-color': Colors.red.shade100
      },
      {
        'icon': "assets/demo_icon/fingerprint.png",
        'color': Colors.green,
        'bg-color': Colors.green.shade100
      },
      {
        'icon': "assets/demo_icon/following.png",
        'color': Colors.purple,
        'bg-color': Colors.purple.shade100
      },
      {
        'icon': "assets/demo_icon/globe.png",
        'color': Colors.deepOrange,
        'bg-color': Colors.deepOrange.shade100
      },
      {
        'icon': "assets/demo_icon/heart.png",
        'color': Colors.pink,
        'bg-color': Colors.pink.shade100
      },
      {
        'icon': "assets/demo_icon/home.png",
        'color': Colors.teal,
        'bg-color': Colors.teal.shade100
      },
      {
        'icon': "assets/demo_icon/instagram.png",
        'color': Colors.deepPurple,
        'bg-color': Colors.deepPurple.shade100
      },
      {
        'icon': "assets/demo_icon/rocket-lunch.png",
        'color': Colors.lightBlue,
        'bg-color': Colors.lightBlue.shade100
      },
      {
        'icon': "assets/demo_icon/rotation.png",
        'color': Colors.lime,
        'bg-color': Colors.lime.shade100
      },
      {
        'icon': "assets/demo_icon/atandt.png",
        'color': Colors.blue,
        'bg-color': Colors.blue.shade100
      },
      {
        'icon': "assets/demo_icon/bank.png",
        'color': Colors.amber,
        'bg-color': Colors.yellow.shade100
      },
      {
        'icon': "assets/demo_icon/delete.png",
        'color': Colors.red,
        'bg-color': Colors.red.shade100
      },
      {
        'icon': "assets/demo_icon/fingerprint.png",
        'color': Colors.green,
        'bg-color': Colors.green.shade100
      },
      {
        'icon': "assets/demo_icon/following.png",
        'color': Colors.purple,
        'bg-color': Colors.purple.shade100
      },
      {
        'icon': "assets/demo_icon/globe.png",
        'color': Colors.deepOrange,
        'bg-color': Colors.deepOrange.shade100
      },
      {
        'icon': "assets/demo_icon/heart.png",
        'color': Colors.pink,
        'bg-color': Colors.pink.shade100
      },
      {
        'icon': "assets/demo_icon/home.png",
        'color': Colors.teal,
        'bg-color': Colors.teal.shade100
      },
      {
        'icon': "assets/demo_icon/instagram.png",
        'color': Colors.deepPurple,
        'bg-color': Colors.deepPurple.shade100
      },
      {
        'icon': "assets/demo_icon/rocket-lunch.png",
        'color': Colors.lightBlue,
        'bg-color': Colors.lightBlue.shade100
      },
      {
        'icon': "assets/demo_icon/rotation.png",
        'color': Colors.lime,
        'bg-color': Colors.lime.shade100
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aaskbkbskj"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2.5,
            crossAxisSpacing: 2.5,
          ),
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              elevation: 3,
              color: iconList[index]['bg-color'],
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(iconList[index]['icon'], color: iconList[index]['color'], scale: 11.5),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text("Label"),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: iconList.length,
        ),
      ),
    );
  }
}
