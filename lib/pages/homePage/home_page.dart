import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: Center(child: Text(title)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          Center(
            child: Container(
              padding: EdgeInsets.all(100),
              width: 500,
              color: Colors.black54,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: controller.increase, child: Icon(Icons.add),),
    );
  }
}
