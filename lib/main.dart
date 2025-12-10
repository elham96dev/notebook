
import 'package:flutter/material.dart';
import 'package:notebook/views/edit_update_view.dart';
import 'package:notebook/views/notes_view.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "note_view": (context) => NotesView(),
        "edit_update_view": (context) => EditUpdateView(),
      },
      initialRoute: "note_view",
      // home: EditUpdateView(),
    );
   
  }
  
}



