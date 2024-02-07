import 'package:password_generator/features/home/domain/entities/save_password.dart';

class SavePasswordModel extends SavePasswordEntity {
  SavePasswordModel(
      {super.id,
      required super.title,
      required super.password,
      required super.date});
  factory SavePasswordModel.fromJson(Map<String, dynamic> json) {
    return SavePasswordModel(
        id: json['id'],
        title: json['title'],
        password: json['password'],
        date: json['date']);
  }
}
