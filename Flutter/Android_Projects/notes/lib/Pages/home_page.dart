import 'package:flutter/material.dart';
import 'package:notes/Database%20Service/database_services.dart';
import 'package:notes/Pages/new_and_edit_notes_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:notes/Pages/notes_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    NotesDatabase().copyPasteAssetFileToRoot().then((value) {
      NotesDatabase().getNotesFromUserNotes();
    });
  }

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
            actions: [IconButton(onPressed: () => _onShare(context), icon: Icon(Icons.share,))],
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

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(
      "Architecture app : https://play.google.com/store/apps/details?id=com.architecture",
      sharePositionOrigin: box!.localToGlobal(Offset.zero)  & box.size,
    );
  }
}
