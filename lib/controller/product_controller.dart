import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/home_model.dart';

class ProductController extends GetxController{
  final Dio dio = Dio();
  var isLoading =false.obs;
  var  product = <Products>[].obs;
  // Future<void> get() async{
  //   try{
  //     isLoading.value =true;
  //     final response = await dio.get("https://dummyjson.com/products");
  //     if(response.statusCode == 200) {
  //       final Map<String,dynamic> data = response.data;
  //       final List<dynamic> productsData = data["products"];
  //       product.value = productsData.map((item)=>Products.fromJson(item)).toList();
  //
  //       print(product);
  //     }else{
  //       print("Error: ${response.statusCode}");
  //     }
  //   } catch(e){
  //     print("Exception:$e");
  //   } finally{
  //     isLoading.value =false;
  //   }
  // }
  Future<Products?> get(int ID) async{
    try{
      isLoading.value =true;
      final response = await dio.get("https://dummyjson.com/products?$ID=12");
      if(response.statusCode == 200) {
        return Products.fromJson(response.data);
      }else{
        print("Error: ${response.statusCode}");
      }
    } catch(e){
      print("Exception:$e");
    } finally{
      isLoading.value =false;
    }
  }
  @override
  void onInit() {
    get(10);
    super.onInit();
  }
}
