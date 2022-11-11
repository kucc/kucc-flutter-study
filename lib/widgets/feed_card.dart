import 'package:flutter/material.dart';
import 'package:instagram_clone/models/feed_model.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({Key? key, required this.model}) : super(key: key);

  final FeedModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(model.imageUrl),
        Text(model.user),
        Text(model.content),
      ]
    );
  }
}