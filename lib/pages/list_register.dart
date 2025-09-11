import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:list/controller/list_controller.dart';
import 'package:list/controller/register_controller.dart';

class ListRegister extends StatelessWidget {
  ListRegister({super.key});
 final ListController controller = Get.put(ListController());
  final _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  final RegisterController registerController = Get.find();
  final Rxn<XFile> image = Rxn<XFile>();
  Future<void> pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    image.value = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      final data = Get.arguments;
      controller.list = data["list"];
      controller.nameController.text = controller.list!.name;
      controller.detailController.text = controller.list!.detail;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Register',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(
            onPressed: pickImage,
            icon: const Icon(Icons.photo, size: 25, color: Colors.black),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () => CircleAvatar(
                  radius: 100,
                  backgroundImage: image.value != null
                      ? FileImage(File(image.value!.path))
                      : null,
                  backgroundColor: Colors.grey[400],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Name',
                  hintText: 'Enter your Name',
                  icon: const Icon(Icons.person, color: Colors.black, size: 25),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.detailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Detail',
                  hintText: 'Enter your Detail',
                  icon: const Icon(
                    Icons.details,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your detail';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (Get.arguments != null) {
                      registerController.editList(
                        Get.arguments["index"],
                        controller.nameController.text,
                        controller.detailController.text,
                      );
                    } else {
                      registerController.addList(
                        controller.nameController.text,
                        controller.detailController.text,
                        image.value?.path ?? '',
                      );
                    }
                    Get.back();
                    controller.nameController.clear();
                    controller.detailController.clear();
                    image.value = null;
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[400],
    );
  }
}


