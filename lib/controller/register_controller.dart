import 'package:get/get.dart';
import 'package:list/model/list_model.dart';
class RegisterController extends GetxController {
  RxList<List>Lists =<List>[].obs;
  final RxBool selectAll = false.obs;
  void addList(String name, String detail,   imagePath) {
    Lists.add(List(name: name, detail: detail, imagePath: imagePath));
  }
  void deleteList(int index) {
    Lists.removeAt(index);
  }

  void editList(int index, String newName, String newDetail ) {
    Lists[index] = List(
      name: newName,
      detail: newDetail,
      imagePath: Lists[index].imagePath,
    );
  }
  void clearAll() {
    Lists.clear();
    Lists.refresh();
  }
  void Select(int index){
    Lists[index].isSelected.value = !Lists[index].isSelected.value;
    if(Lists.every((all) => all.isSelected.value)) {
      selectAll.value = true;
      Lists.refresh();
    }else{
      selectAll.value =false;
      Lists.refresh();
    }
  }
  void deleteSelected(){
    Lists.removeWhere((list)=>list.isSelected.value);
    selectAll.value =false;
    Lists.refresh();
  }

  }
