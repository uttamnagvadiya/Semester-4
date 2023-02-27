import 'package:flutter/material.dart';
import 'package:notes/Pages/new_and_edit_notes_page.dart';
import 'package:notes/Pages/notes_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            // title: Text("Tab Bar"),
            backgroundColor: Color(0x95242424),
            bottom: TabBar(
              labelColor: Colors.yellow.shade700,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.yellow.shade700,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Row(
                    children: const [
                      Expanded(child: Icon(Icons.sticky_note_2_rounded, size: 30),),
                      Expanded(child: Text("Notes", style: TextStyle(fontSize: 17, ),),),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: const [
                      Expanded(child: Icon(Icons.folder, size: 30),),
                      Expanded(child: Text("Folder", style: TextStyle(fontSize: 17,),),),
                    ],
                  ),
                ),
              ],
            ),
          ),

          body: const TabBarView(
            children: [
              NotesList(),
              Icon(Icons.folder, size: 30),
            ],
          ),

        ),
      ),
    );
  }
}
