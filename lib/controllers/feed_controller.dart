import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/controllers/profile_controller.dart';
import 'package:instagram_clone/controllers/upload_controller.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/upload_screen.dart';
import 'package:instagram_clone/services/feed_http_service.dart';

import '../models/feed_model.dart';
import '../models/user_model.dart';

typedef FeedListFunction = Widget Function(FeedController);
typedef FeedFunction = Widget Function(BuildContext, RxList<FeedModel>);
typedef ErrorFunction = Widget Function(BuildContext, RxString);
typedef OnFlyFunction = Widget Function(BuildContext);
typedef OnEmptyFunction = Widget Function(BuildContext);

class FeedController extends GetxController {

  final List<String> tabTexts = [ 'Home', 'Shop' ];
  final ScrollController scrollController = ScrollController();

  final RxList<FeedModel> feedData = RxList([]);
  RxInt tabIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;

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

    isLoading.value = true;
    try {
      var feedList = await FeedHttpService.getFeedListFromServer(
          url: FeedHttpService.feedMoreUrls[feedListIndex]
      );
      for (var feed in feedList) {
        feedData.add(feed);
      }
    } on HttpException catch (e) {
        isError.value = true;
      if (kDebugMode) {
        print('Error ${e.message}');
      }
    } on SocketException catch (se) {
        isError.value = true;
      if (kDebugMode) {
        print('Error ${se.message}');
      }
    }

    isLoading.value = false;
  }

  FeedListFunction buildFeedList({
    required BuildContext context,
    required FeedFunction dataBuilder,
    required ErrorFunction errorBuilder,
    required OnFlyFunction onFlyBuilder,
    required OnEmptyFunction onEmptyBuilder,
  }) {
        return (FeedController controller) {
          if (feedData.isNotEmpty) {
            return dataBuilder(context, feedData);
          } else if (isError.value) {
            return errorBuilder(context, errorMessage);
          } else if (isLoading.value) {
            return onFlyBuilder(context);
          } else {
            return onEmptyBuilder(context);
          }
        };
  }

  void onAddPhotoClick() async {
    var picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.gallery);

    if (image != null) {
      var uploadController = UploadController(
          imagePath: image.path,
          newIndex: feedData.length,
          onSelect: addPhotoFront
      );
      Get.to(UploadScreen(controller: uploadController));
    } else {
      return null;
    }
  }

  void addPhotoFront(FeedModel model) {
    feedData.insert(0, model);
  }

  void onTapUserName(UserModel user) {
    var controller = ProfileController(
      id: user.id,
      user: user,
      userFollowed: false
    );

    navigator!.push(
      CupertinoPageRoute(builder: (context) {
        return ProfileScreen(controller: controller);
      })
    );
  }
}