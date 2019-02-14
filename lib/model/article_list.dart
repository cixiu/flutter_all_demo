import 'package:json_annotation/json_annotation.dart';

part 'article_list.g.dart';

@JsonSerializable()
class ArticleList extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  List<Data> data;

  ArticleList(
    this.code,
    this.data,
  );

  factory ArticleList.fromJson(Map<String, dynamic> srcJson) =>
      _$ArticleListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticleListToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'views_count')
  int viewsCount;

  @JsonKey(name: 'comment_count')
  int commentCount;

  @JsonKey(name: 'category')
  List<Category> category;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'screenshot')
  String screenshot;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'create_time')
  String createTime;

  @JsonKey(name: 'last_update_time')
  String lastUpdateTime;

  Data(
    this.author,
    this.viewsCount,
    this.commentCount,
    this.category,
    this.title,
    this.screenshot,
    this.description,
    this.id,
    this.createTime,
    this.lastUpdateTime,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Category extends Object {
  @JsonKey(name: 'title')
  String title;

  Category(
    this.title,
  );

  factory Category.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
