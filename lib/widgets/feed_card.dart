import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/models/feed_model.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/styles.dart' as styles;

class FeedCard extends StatelessWidget {
  const FeedCard({
    Key? key,
    required this.feedData,
    required this.onTapUserName
  }) : super(key: key);

  final FeedModel feedData;
  final Function(UserModel) onTapUserName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        feedData.imageUrl != null ?
        Image.network(feedData.imageUrl!) :
        Image.file(File(feedData.localImage!)),
        GestureDetector(
          onTap: () {
            onTapUserName(feedData.user);
          },
          child: Hero(
            tag: 'username_${feedData.id}',
            child: Text(feedData.user.username, style: styles.usernameFeedStyle),
          ),
        ),
        Text(feedData.content),
      ]
    );
  }
}