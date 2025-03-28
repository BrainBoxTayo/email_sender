

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CounterController extends GetxController {
  var counter = 0.obs;

  void increase() {
    counter++;
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text("You have clicked this ${controller.counter} times"),
            )
            
          ],          
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: controller.increase, child: Icon(Icons.add),),
    );
  }
}
