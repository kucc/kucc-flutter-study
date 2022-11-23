import 'package:get/get.dart';

import '../models/user_model.dart';

class ProfileController extends GetxController {

  final user = UserModel(0, 'default', 0).obs;
  var clientFollowed = false.obs;

  ProfileController();

  initProfileData({required UserModel newUser, bool userFollowed = false}) {
    user(newUser);
    clientFollowed.value = userFollowed;
  }

  clientUserFollowToggle() {
    if (!clientFollowed.value) {
      user.update((model) {
        model!.followerCount += 1;
      });
      clientFollowed.value = true;
    } else {
      user.update((model) {
        model!.followerCount -= 1;
      });
      clientFollowed.value = false;
    }
  }
}