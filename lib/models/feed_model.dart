
import 'package:json_annotation/json_annotation.dart';

part 'feed_model.g.dart';

@JsonSerializable()
class FeedModel {

  FeedModel(this.id, this.imageUrl, this.likes, this.date, this.content, this.liked, this.user);

  final int id;
  @JsonKey(name: 'image')
  final String imageUrl;
  final int likes;
  final String date;
  final String content;
  final bool liked;
  final String user;

  factory FeedModel.fromJson(Map<String, dynamic> json) => _$FeedModelFromJson(json);
  Map<String, dynamic> toJson() => _$FeedModelToJson(this);
}
