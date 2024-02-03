import 'package:password_generator/features/home/domain/entities/save_password.dart';

class SavePasswordModel extends SavePasswordEntity {
  SavePasswordModel(
      {required super.title, required super.password, required super.date});
  factory SavePasswordModel.fromJson(Map<String, dynamic> json) {
    return SavePasswordModel(
        title: json['title'], password: json['password'], date: json['date']);
  }
}
