import 'package:get/get.dart';
import 'package:list/model/list_model.dart';
class RegisterController extends GetxController {
  RxList<List>userList =<List>[].obs;
  var selectedItem =<int>[].obs;
  final RxBool selectAll = false.obs;
  void addList(String name, String detail,   imagePath) {
    userList.add(List(name: name, detail: detail, imagePath: imagePath));
  }
  void deleteList(int index) {
    userList.removeAt(index);
    userList.refresh();
  }
  void editList(int index, String newName, String newDetail ) {
    userList[index] = List(
      name: newName,
      detail: newDetail,
      imagePath: userList[index].imagePath,
    );
  }
  void clearAll() {
    userList.clear();
    userList.refresh();
  }
  void select(int index){
    userList[index].isSelected.value = !userList[index].isSelected.value;
    userList.refresh();
  }
  void deleteSelected(){
    userList.removeWhere((list)=>list.isSelected.value);
    selectAll.value =false;
    userList.refresh();
  }

}

