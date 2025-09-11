import 'package:get/get.dart';

class List {
  String name;
  String detail;
  String? imagePath;
  RxBool isSelected;
  List({
    required this.name,
    required this.detail,
    this.imagePath,
    bool isSelected = false,
  }) : isSelected = isSelected.obs;
}
