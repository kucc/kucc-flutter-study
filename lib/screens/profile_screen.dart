import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controllers/feed_controller.dart';
import 'package:instagram_clone/styles.dart' as styles;

import '../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.controller}) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {

    Get.put(controller);

    return Scaffold(
      appBar: AppBar(
        title: GetX<ProfileController>(
          builder: (controller) {
            return Hero(
              tag: 'username_${controller.user.value.id}',
              child: Text(controller.user.value.username, style: styles.usernameAppBarStyle),
            );
          }
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 50,
                ),
                GetX<ProfileController>(
                  builder: (controller) {
                    return Text('팔로워 ${controller.user.value.followerCount}');
                  },
                ),
                ElevatedButton(
                    onPressed: controller.clientUserFollowToggle,
                    child: const Text('팔로우'))
              ],
            ),
          ),
          GetX<FeedController>(
            builder: (feedController) {
              return SliverGrid(delegate: SliverChildBuilderDelegate(
                (c, i) {
                  return feedController.feedData[i].imageUrl != null ?
                  Image.network(feedController.feedData[i].imageUrl!) :
                  Image.file(File(feedController.feedData[i].localImage!));
                },
                childCount: feedController.feedData.length
              ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3));
            }
          )
        ],
      ),
    );
  }
}
