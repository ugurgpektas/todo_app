import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model.dart';
class NoteController extends GetxController {
  var notes = < Note >[].obs;
  void add(Note n) {
    notes.add(n);
  }
  @override
  void onInit() {
    List? storedNotes = GetStorage().read < List > ('notes');
    if (!storedNotes.isNull) {
      notes = storedNotes!.map((e) => Note.fromJson(e)).toList().obs;
    }
    ever(notes, (_) {
      GetStorage().write('notes', notes.toList());
    });
    super.onInit();
  }
}