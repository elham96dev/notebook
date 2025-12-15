
import 'package:flutter/material.dart';
import 'package:notebook/constant/color_constant.dart';
import 'package:notebook/model/notes.dart';
import 'package:notebook/views/service/note_service.dart';
import 'package:notebook/widgets/custom_textfield_widget.dart';

class EditUpdateView extends StatefulWidget{
  const EditUpdateView({super.key});

  @override
  State<StatefulWidget> createState() => _EditUpdateViewState();

}

class _EditUpdateViewState extends State<EditUpdateView> {

  late final TextEditingController _titleController;
  late final TextEditingController _textController;
  final NoteService _noteService = NoteService();
  Notes? note;
  @override
  void initState() {
    _titleController = TextEditingController();
    _textController = TextEditingController();
     super.initState();
  }
  @override
  void dispose(){
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }
  void initial({required BuildContext context}) {
    // final modalRoute = ModalRoute.of(context);
    // if(modalRoute != null){
    //   final arg = modalRoute.settings.arguments;
    //   if(arg != null && arg is Notes){
    //     return arg;
    //   }
    // }
    // return null;
    note = context.argument();
  }

  @override
  Widget build(BuildContext context) {
    initial(context: context);
   return Scaffold(
    backgroundColor: black5,
    appBar: AppBar(
      backgroundColor: black6,
      title: GestureDetector(
        onTap: () {
         Navigator.pop(context);
        },
        child: Text(
          "New Note",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      actions: [
      IconButton(onPressed:() {
        if ( note != null) {
          //update
        } else {
          //creat
          final dateTime = DateTime.now();
          _noteService.insert(
            notes: Notes(
              title: _titleController.text,
              text: _textController.text,
              datetime: "${dateTime.day}/${dateTime.month}/${dateTime.year}"
            ),
          );
          Navigator.pop(context);
        }
      },
       icon: Icon(
        Icons.check,
        color: Colors.white,
        size: 38,
       )
       ),
      ],
    ), 
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomTextfield(hintText: "title",
               maxLines: 1,
               controller: _titleController,
               ),
               CustomTextfield(
                
                hintText: "Text...",
                maxLines: null,
                controller: _textController,
                 ),
              
            ],
          ),
        ),
      ),
   );
  }
}

extension GetArg on BuildContext {
  Notes? argument(){
    final context = this;
    final modalRoute = ModalRoute.of(context);

    if (modalRoute != null){
      final arg =modalRoute.settings.arguments;
      if(arg != null && arg is Notes){
        return arg;
      }
    }
    return null;
  }
}