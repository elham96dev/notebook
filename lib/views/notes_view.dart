import 'package:flutter/material.dart';
import 'package:notebook/constant/color_constant.dart';
import 'package:notebook/views/service/note_service.dart';

enum MenuAction {delete, selectAll}

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  final _noteService = NoteService();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: black5 ,
    appBar: AppBar(
      backgroundColor: black6,
      title: Text(
        "Notes",
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
      centerTitle: true,
      actions: [

        PopupMenuButton<MenuAction>(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 34,
            ),
            color: Colors.grey.shade800,
            onSelected: (value) {
              switch(value) {
                case MenuAction.delete:
                  print("delete all");
                break;
                case MenuAction.selectAll:
                  print("select all");
                break;
              }
            },
          itemBuilder: (context){
            return [
              PopupMenuItem<MenuAction>(
              value: MenuAction.delete,
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 22,
                  ),
                  Text(
                    "Delete All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    ),
                ],
              ),
                ),
                       PopupMenuItem<MenuAction>(
              value: MenuAction.selectAll,
              child: Row(
                children: [
                  Icon(
                    Icons.select_all_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                  Text(
                    "Select All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    ),
                ],
              ),
                ),
            ];
        })
      ],
    ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // print("++++++");
        Navigator.of(context).pushNamed(
          "edit_update_view",
          arguments: null,
          );
      },
      backgroundColor: Colors.blue.shade900,
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
        size: 32,
        color: Colors.white,
      ),
      ),
      body: 
      FutureBuilder(
        future: _noteService.getNotes(),
        builder: (context, snapshot){
          print("------------------------");
          print("snapshot data ");
          print(snapshot.hasData);
          print("------------------------");
          if (!snapshot.hasData){
            //has not data
            return CircularProgressIndicator(
              color: Colors.blueAccent,
            );
          }
          //has data
          final notes = snapshot.data ?? [];
          if (notes.isEmpty){
            return Center(
              child: Text('Don\'t have any note!',
              style: TextStyle(
                color: Colors.grey.shade300,
                fontWeight: FontWeight.w400,
              ),
              ),
            ); 
          }
          //has note
          return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.2,
            ),
          itemCount: notes.length,
           itemBuilder:(context, index) {
            final note = notes[index];
            return GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                "edit_update_view",
                arguments: note,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
                color: gray9,
                child: Column(
                  children: [
                    Text(
                      note.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7.0),
                      margin: EdgeInsets.only(top: 15,left: 2,right: 2,bottom: 2),
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                      child: Text(
                        note.text,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 18,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(""),
                       ),
                       Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(22)),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              note.datetime,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ],
                ),
               ),
            );
           },
          );
        },
        ),
      );
  }
}