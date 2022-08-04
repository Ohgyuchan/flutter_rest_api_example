import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rest API Using GetX',
        ),
        centerTitle: true,
      ),
      body: Obx(() => dataController.isDataLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dataController.userModel!.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: const EdgeInsets.only(left: 20),
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(dataController
                                  .userModel!.data![index].picture!),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dataController.userModel!.data![index].title!
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                    dataController
                                        .userModel!.data![index].firstName!,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18)),
                                Text(
                                    dataController
                                        .userModel!.data![index].lastName!,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18)),
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              })),
    );
  }
}
