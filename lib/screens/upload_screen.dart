import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key, required this.image}) : super(key: key);
  final File image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('이미지업로드화면'),
            Image.file(image),
            IconButton(
                onPressed: Get.back,
                icon: const Icon(Icons.close)
            ),
          ],
        )
    );

  }
}