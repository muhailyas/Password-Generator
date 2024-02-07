class SavePasswordEntity {
  final int? id;
  final String title;
  final String password;
  final String date;

  SavePasswordEntity(
      {this.id,
      required this.title,
      required this.password,
      required this.date});
}
