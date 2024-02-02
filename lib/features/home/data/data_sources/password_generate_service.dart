import 'dart:math';
import 'package:password_generator/features/home/data/models/generated_password.dart';
import 'package:password_generator/features/home/data/models/password_generate_model.dart';

class PasswordGenerateService {
  GeneratedPasswordModel generatePassword(
      {required PasswordGenerate passwordGenerate}) {
    const lowerCase = 'abcdefghijklmnopqrstuvwxyz';
    const upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const specialChars = '@#=+!\$%^&*()?{}';
    String chars = '';
    if (passwordGenerate.lowerCase) chars += lowerCase;
    if (passwordGenerate.upperCase) chars += upperCase;
    if (passwordGenerate.numbers) chars += numbers;
    if (passwordGenerate.specialChars) chars += specialChars;
    final password = List.generate(passwordGenerate.length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);
      return chars[indexRandom];
    }).join('');
    return GeneratedPasswordModel(password: password);
  }
}
