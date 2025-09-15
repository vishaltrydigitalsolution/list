import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/product_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text("API(GET)"),
      backgroundColor: Colors.grey[200],),
      body: _ListView(),
    );
  }
  Widget _ListView() {
    return Obx(
      () => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : controller.product.isEmpty
          ? Center(child: Text("no data is here"))
          : ListView.builder(
              itemCount: controller.product.length,
              itemBuilder: (context, index) {
                final data = controller.product[index];
                return Card(
                  elevation: 10,
                  child: ListTile(
                    leading: Image.network(data.images!.first),
                    title: Text(data.id.toString()),
                    subtitle: Text(data.title??""),

                  ),
                );
              },
            ),
    );
  }
}
