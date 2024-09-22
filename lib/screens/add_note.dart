import 'package:counter_getx/controller/note_controller.dart';
import 'package:counter_getx/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'home_page.dart';

class AddNote extends StatelessWidget {
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  //for accessing all things of GetX we have to use it
  NoteController noteCon = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: titleC,
            ),
            TextField(
              controller: descC,
            ),
            ElevatedButton(
                onPressed: () {
                  noteCon.addInGetX(
                      newNote: NoteModel(
                          title: titleC.text.toString(),
                          desc: descC.text.toString()));
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MyHomePage();
                  }));
                },
                child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
