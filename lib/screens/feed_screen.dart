import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controllers/feed_controller.dart';

import '../models/feed_model.dart';
import '../widgets/feed_card.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FeedController());

    return GetBuilder<FeedController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text('Instagram'),
            actions: [
              IconButton(
                  onPressed: controller.onAddPhotoClick,
                  icon: const Icon(Icons.add_box_outlined)
              )
            ],
          ),
          bottomNavigationBar: GetX<FeedController>(
            builder: (controller) {
              return BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: controller.tabIndex.value,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(Icons.home),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_bag_outlined),
                      activeIcon: Icon(Icons.shopping_bag),
                      label: 'Shopping'),
                ],
                onTap: controller.changeTab,
              );
            }
          ),
          body: StreamBuilder<FeedModel>(
            stream: controller.feedStream,
            builder: controller.buildFeedList(
                dataBuilder: (context, feed) {
                  return ListView.builder(
                    itemCount: controller.feedData.length,
                    controller: controller.scrollController,
                    itemBuilder: (context, index) {
                      return FeedCard(model: controller.feedData[index]);
                    },
                  );
                },
                errorBuilder: (context, error) {
                  return Text('$Error {error}');
                },
                onFlyBuilder: (context) {
                  return const CircularProgressIndicator();
                }
            )
          )
        );
      }
    );
  }
}
