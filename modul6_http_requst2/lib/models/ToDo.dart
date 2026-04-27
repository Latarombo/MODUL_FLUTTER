class ToDo {
  int? userId;
  int? id;
  String? title;

  ToDo(this.userId,this.id,this.title);

  ToDo.fromJson(Map<String,dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.userId = parsedJson['userId'];
  }
}