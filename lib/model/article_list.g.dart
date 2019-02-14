// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleList _$ArticleListFromJson(Map<String, dynamic> json) {
  return ArticleList(
      json['code'] as int,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ArticleListToJson(ArticleList instance) =>
    <String, dynamic>{'code': instance.code, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['author'] as String,
      json['views_count'] as int,
      json['comment_count'] as int,
      (json['category'] as List)
          ?.map((e) =>
              e == null ? null : Category.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['title'] as String,
      json['screenshot'] as String,
      json['description'] as String,
      json['id'] as int,
      json['create_time'] as String,
      json['last_update_time'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'author': instance.author,
      'views_count': instance.viewsCount,
      'comment_count': instance.commentCount,
      'category': instance.category,
      'title': instance.title,
      'screenshot': instance.screenshot,
      'description': instance.description,
      'id': instance.id,
      'create_time': instance.createTime,
      'last_update_time': instance.lastUpdateTime
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(json['title'] as String);
}

Map<String, dynamic> _$CategoryToJson(Category instance) =>
    <String, dynamic>{'title': instance.title};
