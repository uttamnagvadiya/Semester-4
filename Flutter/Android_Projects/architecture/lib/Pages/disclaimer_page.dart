import 'package:architecture/Pages/home_page.dart';
import 'package:flutter/material.dart';

class DisclaimerPage extends StatefulWidget {
  const DisclaimerPage({Key? key}) : super(key: key);

  @override
  State<DisclaimerPage> createState() => _DisclaimerPageState();
}

class _DisclaimerPageState extends State<DisclaimerPage> {
  List<String> points = [
    """This is not official app of ACPC.""",
    """Information displayed here is collected from various websites.""",
    """We have tried our best to verify information but we are not liable for any kind of error or mistake in information.""",
    """App works without internet but stay connected with internet to get latest News & Update."""
  ];

  bool isBold = false;



  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("DISCLAIMER"),
          backgroundColor: Color(0xFFAB00AB),
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(8),
              child: Column(
                children: points.map((point) {
                  point == points[0] ? isBold = true : isBold = false;
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            '\u2022',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          alignment: Alignment.topCenter,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            point,
                            textAlign: TextAlign.justify,
                            softWrap: true,
                            style: TextStyle(
                              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                              fontSize: 15,
                              height: 1.50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFAB00AB), //
                elevation: 10// ba // foreground
              ),
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
