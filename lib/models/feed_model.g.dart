// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedModel _$FeedModelFromJson(Map<String, dynamic> json) => FeedModel(
      id: json['id'] as int,
      imageUrl: json['image'] as String?,
      localImage: json['localImage'] as String?,
      likes: json['likes'] as int,
      date: json['date'] as String,
      content: json['content'] as String,
      liked: json['liked'] as bool,
      user: json['user'] as String,
    );

Map<String, dynamic> _$FeedModelToJson(FeedModel instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.imageUrl,
      'localImage': instance.localImage,
      'likes': instance.likes,
      'date': instance.date,
      'content': instance.content,
      'liked': instance.liked,
      'user': instance.user,
    };
