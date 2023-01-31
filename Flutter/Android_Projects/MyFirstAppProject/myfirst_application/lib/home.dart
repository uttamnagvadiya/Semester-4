import 'package:flutter/material.dart';
import 'package:myfirst_application/birthday_card.dart';
import 'package:myfirst_application/home_page.dart';
import 'package:myfirst_application/screen1_page.dart';
import 'package:myfirst_application/screen2_page.dart';
import 'package:myfirst_application/simple_interest.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    BirthdayCard(),BalancePage(),SimpleInterest(),BankHomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("asdf"),
        actions: [
          PopupMenuButton(
              itemBuilder: (context){
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("My Account"),
                  ),

                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Settings"),
                  ),

                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text("Logout"),
                  ),
                ];
              },
              onSelected:(value){
                if(value == 0){
                  print("My account menu is selected.");
                }else if(value == 1){
                  print("Settings menu is selected.");
                }else if(value == 2){
                  print("Logout menu is selected.");
                }
              }
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        currentIndex: _selectedIndex,

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, ),
              label: "Home",
              backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Wallet",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mark_unread_chat_alt_outlined),
            label: "Notification",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
            backgroundColor: Colors.black,
          ),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
