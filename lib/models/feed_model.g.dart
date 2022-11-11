// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedModel _$FeedModelFromJson(Map<String, dynamic> json) => FeedModel(
      json['id'] as int,
      json['image'] as String,
      json['likes'] as int,
      json['date'] as String,
      json['content'] as String,
      json['liked'] as bool,
      json['user'] as String,
    );

Map<String, dynamic> _$FeedModelToJson(FeedModel instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.imageUrl,
      'likes': instance.likes,
      'date': instance.date,
      'content': instance.content,
      'liked': instance.liked,
      'user': instance.user,
    };
