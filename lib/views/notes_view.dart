import 'package:flutter/material.dart';
import 'package:notebook/constant/color_constant.dart';

enum MenuAction {delete, selectAll}

class NotesView extends StatelessWidget {
  const NotesView({super.key});

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
        Navigator.of(context).pushNamed("edit_update_view");
      },
      backgroundColor: Colors.blue.shade900,
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
        size: 32,
        color: Colors.white,
      ),
      ),
      body: Container(
        margin: EdgeInsets.all(3),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.2,
            ),
          itemCount: 3,
           itemBuilder:(context, index) {
            return Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
              color: gray9,
              child: Column(
                children: [
                  Text(
                    "Title",
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
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
                            "9/12/2025",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ))
                    ],
                  )
                ],
              ),
             );
           },
           ),
      ),
      
  );
  }
}