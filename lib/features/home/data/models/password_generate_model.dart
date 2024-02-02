class PasswordGenerate {
  final int length;
  final bool upperCase;
  final bool lowerCase;
  final bool numbers;
  final bool specialChars;

  PasswordGenerate(
      {required this.length,
      required this.upperCase,
      required this.lowerCase,
      required this.numbers,
      required this.specialChars});
}
