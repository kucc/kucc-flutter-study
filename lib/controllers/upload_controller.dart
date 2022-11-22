import 'package:get/get.dart';
import '../models/feed_model.dart';

typedef OnSelectFunction = Function (FeedModel model);

class UploadController extends GetxController {
  
  final String imagePath;
  final int newIndex;
  final OnSelectFunction onSelect;

  UploadController({
    required this.imagePath,
    required this.newIndex,
    required this.onSelect
  });

  sendToFeed() {
    var model = FeedModel(
        id: newIndex,
        localImage: imagePath,
        likes: 0,
        date: DateTime.now().toString(),
        content: '안녕',
        liked: false,
        user: '나');

    onSelect(model);
    Get.back();
  }
}
