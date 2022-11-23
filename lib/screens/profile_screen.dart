import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              tag: 'username_${controller.id}',
              child: Text(controller.username.value, style: styles.usernameAppBarStyle),
            );
          }
        ),
      ),
      body: Text('profile'),
    );
  }
}
