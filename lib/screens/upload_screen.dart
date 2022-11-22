import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controllers/upload_controller.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key, required this.controller}) : super(key: key);

  final UploadController controller;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: controller.sendToFeed,
                icon: const Icon(Icons.send)
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('이미지업로드화면'),
            Image.file(File(controller.imagePath)),
            IconButton(
                onPressed: Get.back,
                icon: const Icon(Icons.close)
            ),
          ],
        )
    );

  }
}