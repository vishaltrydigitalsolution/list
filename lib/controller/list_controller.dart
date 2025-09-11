import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/model/list_model.dart';

class ListController extends GetxController{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  late List? list ;
}