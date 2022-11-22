import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/screens/upload_screen.dart';
import 'package:instagram_clone/services/feed_http_service.dart';

import '../models/feed_model.dart';

typedef FeedListFunction = Widget Function(BuildContext, AsyncSnapshot<FeedModel>);
typedef FeedFunction = Widget Function(BuildContext, FeedModel);
typedef ErrorFunction = Widget Function(BuildContext, Object?);
typedef OnFlyFunction = Widget Function(BuildContext);

class FeedController extends GetxController {

  final List<String> tabTexts = [ 'Home', 'Shop' ];
  final List<FeedModel> feedData = [];
  final ScrollController scrollController = ScrollController();
  final StreamController<FeedModel> feedStreamController = StreamController.broadcast();
  late final Stream<FeedModel> feedStream = feedStreamController.stream;
  RxInt tabIndex = 0.obs;

  int feedListIndex = -1;
  int maxFeedListIndex = 2;

  FeedController() {
    scrollController.addListener(onFeedListScrollChange);
    getFeeds();
  }

  void onFeedListScrollChange() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {

      if (feedListIndex <= 2) {
        getFeeds(url: FeedHttpService.feedMoreUrls[feedListIndex]);
      }
    }
  }

  void changeTab(int index) {
    tabIndex.value = index;
  }

  void getFeeds({String? url}) async {

    if (feedListIndex < maxFeedListIndex) {
      feedListIndex += 1;
    } else {
      return;
    }

    try {
      var feedList = await FeedHttpService.getFeedListFromServer(
          url: FeedHttpService.feedMoreUrls[feedListIndex]
      );
      for (var feed in feedList) {
        feedStreamController.add(feed);
        feedData.add(feed);
      }
    } on HttpException catch (e) {
      if (kDebugMode) {
        print('Error ${e.message}');
      }
    }
  }

  FeedListFunction buildFeedList({
    required FeedFunction dataBuilder,
    required ErrorFunction errorBuilder,
    required OnFlyFunction onFlyBuilder,
  }) {
        return (BuildContext context, AsyncSnapshot<FeedModel> snapshot) {
          if (snapshot.hasData) {
            return dataBuilder(context, snapshot.requireData);
          } else if (snapshot.hasError) {
            return errorBuilder(context, snapshot.error);
          } else {
            return onFlyBuilder(context);
          }
        };
  }

  void onAddPhotoClick() async {
    var picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.gallery);

    if (image != null) {
      var file = File(image.path);
      Get.to(UploadScreen(image: file));
    } else {
      return null;
    }
  }
}