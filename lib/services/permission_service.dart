import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      if (kDebugMode) {
        print('허락됨');
      }
      return true;
    } else {
      if (kDebugMode) {
        print('ㄴㄴ');
      }

      var result = await Permission.contacts.request();
      if (result.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }
}