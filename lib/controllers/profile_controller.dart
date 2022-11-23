import 'package:get/get.dart';

import '../models/user_model.dart';

class ProfileController extends GetxController {

  final UserModel user;
  final int id;

  final RxString username;
  final RxInt followerCount;
  final RxBool userFollowed;

  ProfileController({
    required this.id,
    required this.user,
    required bool userFollowed
  }) :
  username = RxString(user.username),
  followerCount = RxInt(user.followerCount),
  userFollowed = RxBool(userFollowed);
}