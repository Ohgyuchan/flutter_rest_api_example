import 'package:flutter_rest_api_example/models/picture_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
      ),
      body: Obx(() => RefreshIndicator(
            onRefresh: () => Future.sync(
              () => DataController.instance.pagingController.value.refresh(),
            ),
            child: PagedListView<int, PictureModel>.separated(
              pagingController: DataController.instance.pagingController.value,
              builderDelegate: PagedChildBuilderDelegate<PictureModel>(
                // firstPageProgressIndicatorBuilder: ((_) => Text('firstPage')),
                newPageProgressIndicatorBuilder: (_) =>
                    DataController.instance.isLast.value
                        ? Container()
                        : const Center(child: CircularProgressIndicator()),
                // noItemsFoundIndicatorBuilder: (_) => Text('noItemsFound'),
                // noMoreItemsIndicatorBuilder: (_) => Text('noMoreItems'),
                animateTransitions: true,
                itemBuilder: (context, item, index) => Card(
                  child: Column(
                    children: [
                      Text(
                        item.author,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.network(
                          'https://picsum.photos/id/${item.id}/300/300')
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const Divider(),
            ),
          )),
    );
  }
}
