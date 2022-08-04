import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data_controllers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "REST API(HTTP & JSON)",
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await DataController.instance.fetchApi();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Obx(() => ListView.builder(
          itemCount: DataController.instance.pictures.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text(
                    DataController.instance.pictures[index].author,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.network(
                      'https://picsum.photos/id/${DataController.instance.pictures[index].id}/300/300')
                ],
              ),
            );
          })),
    );
  }
}
