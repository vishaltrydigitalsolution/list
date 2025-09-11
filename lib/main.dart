import 'package:flutter/material.dart';
import 'package:list/pages/list_pages.dart';
import 'package:list/pages/list_register.dart';
import 'package:list/routes/list_routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/list',
      routes: {
        AppRoutes.list: (context) => ListPages(),
        AppRoutes.register: (context) => ListRegister(),
      },
    );
  }
}


