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
      appBar: AppBar(
        title: Text("API(GET)"),
        backgroundColor: Colors.grey[200],
        actions: [
          Container(
              width: 00,
              height: 50,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)
              ),
              child:const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search,color: Colors.black,)

                ),
              )
          ),
        ],
      ),
      body: Obx(()=>ListView(children: [
        controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : controller.product.isEmpty
            ? Center(child: Text("no data is here"))
            : ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.product.length,
          itemBuilder: (context, index) {
            final data = controller.product[index];
            return Card(
              elevation: 10,
              child: ListTile(
                leading: Image.network(data.images!.first),
                title: Text(data.id.toString()),
                subtitle: Text(data.title ?? ""),
                trailing: Text("\$${data.price}"),
              ),
            );
          },
        ),
      ],))
    );
  }
}
