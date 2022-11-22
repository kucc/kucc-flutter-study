

import 'package:json_annotation/json_annotation.dart';

part 'feed_model.g.dart';

@JsonSerializable()
class FeedModel {

  FeedModel({
    required this.id,
    this.imageUrl,
    this.localImage,
    required this.likes,
    required this.date,
    required this.content,
    required this.liked,
    required this.user});

  final int id;
  @JsonKey(name: 'image')
  final String? imageUrl;
  @JsonKey(name: 'localImage')
  final String? localImage;
  final int likes;
  final String date;
  final String content;
  final bool liked;
  final String user;

  factory FeedModel.fromJson(Map<String, dynamic> json) => _$FeedModelFromJson(json);
  Map<String, dynamic> toJson() => _$FeedModelToJson(this);
}
