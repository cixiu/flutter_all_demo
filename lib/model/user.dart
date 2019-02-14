import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'user.g.dart';

/// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class User {
  final String name;
  final int age;
  final String gender;
  final String address;

  User({ this.name = '朝阳群众', this.age = 20, this.gender = '男', this.address = '北京市朝阳区' });

  User copyWith({ String name, int age, String gender, String address }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      address: address ?? this.address
    );
  }

  /// 'xx.g.dart'文件中，默认会根据当前类名如 AA 生成 _$AAeFromJson方法
  /// 所以当前类名为User，生成的抽象类为 _$UserFromJson
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  // 反序列化user 用于从一个map构造出一个 User实例 map structure
  // User.fromJson(Map<String, dynamic> json) : 
  //   name = json['name'],
  //   age = json['age'],
  //   gender = json['gender'],
  //   address = json['address'];

  // 序列化一个user 将 User 实例转化为一个map
  // Map<String, dynamic> toJson() => {
  //   'name': name,
  //   'age': age,
  //   'gender': gender,
  //   'address': address
  // };
}