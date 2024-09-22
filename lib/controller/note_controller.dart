import 'package:counter_getx/database/db_helper.dart';
import 'package:counter_getx/model/note_model.dart';
import 'package:get/get.dart';

class NoteController extends GetxController{

  //when change will apply it will observe and tell OBx
  RxList<NoteModel> allNote = <NoteModel>[].obs;

  DbHelper mainDb = Get.put(DbHelper.getInstances);
  void addInGetX({required NoteModel newNote})async{
    bool check = await mainDb.addNoteDb(newNote: newNote);
    if(check){
      allNote.value =await mainDb.getNoteDb();
    }
  }
  List<NoteModel> getNote(){
    return allNote;
  }

  void getInitialNote()async{
    allNote.value = await mainDb.getNoteDb();
  }
}