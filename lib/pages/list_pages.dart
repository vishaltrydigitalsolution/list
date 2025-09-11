import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/controller/register_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ListPages extends StatelessWidget {
  ListPages({super.key});
  final RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          'List Pages',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(
            onPressed: () {
              if (controller.Lists.isEmpty)
              {
              } else {
                controller.selectAll.value = !controller.selectAll.value;
                for (var list in controller.Lists) {
                  list.isSelected.value = controller.selectAll.value;
                }
                controller.Lists.refresh();
              }
            },
            icon: const Icon(Icons.select_all, size: 25, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              controller.clearAll();
            },
            icon: Icon(Icons.clear_all, size: 25, color: Colors.black),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            controller.deleteSelected();
          },
          icon: Icon(Icons.delete, size: 24, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.Lists.isEmpty) {
          return const Center(
            child: Text(
              "No data available",
              style: TextStyle(fontSize: 32, color: Colors.black),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.Lists.length,
          itemBuilder: (context, screen) {
            final list = controller.Lists[screen];
            return Slidable(
              key: ValueKey(screen),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      controller.Lists.removeAt(screen);
                    },
                    backgroundColor: Colors.grey[400]!,
                    foregroundColor: Colors.black,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      Get.toNamed(
                        '/register',
                        arguments: {"index": screen, "list": list},
                      );
                    },
                    backgroundColor: Colors.grey[400]!,
                    foregroundColor: Colors.black,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ],
              ),
              child: Card(
                color: screen.isEven ? Colors.grey[500] : Colors.grey[400],
                elevation: 20,
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: list.imagePath!.isNotEmpty
                      ? Image.file(
                          File(list.imagePath!),
                          width: 60,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.image_not_supported,
                          color: Colors.black,
                        ),
                  title: Text(
                    list.name,
                    style: const TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  subtitle: Text(
                    list.detail,
                    style: const TextStyle(color: Colors.black54, fontSize: 17),
                  ),
                  trailing: Checkbox(
                    value: list.isSelected.value,
                    onChanged: (value) {
                      controller.Select(screen);
                    },
                  ),
                ),
              ),
            );
          },
        );
      }),
      backgroundColor: Colors.grey[400],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/register');
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }
}


