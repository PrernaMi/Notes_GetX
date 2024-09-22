import 'package:counter_getx/controller/note_controller.dart';
import 'package:counter_getx/model/note_model.dart';
import 'package:counter_getx/screens/add_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NoteController noteCon = Get.put(NoteController());

  @override
  void initState() {
    noteCon.getInitialNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: true,
      ),
      //Obx will update the UI whenever list will change in db
      //it will works as builder in Bloc
      body: Obx(() {
        return ListView.builder(
            itemCount: noteCon.allNote.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(noteCon.allNote[index].title),
                subtitle: Text(noteCon.allNote[index].desc),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddNote();
            },
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
