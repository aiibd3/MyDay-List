class TaskModel {
  String id;
  String title;
  String description;
  bool status;
  int date;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.status,
      required this.date});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          status: json['status'],
          date: json[TaskModelKeys.dateKey],
        );

///////// another way /////////
//   TaskModel fromJson(Map<String, dynamic> json) {
//     TaskModel taskModel = TaskModel(
//         id: json['id'],
//         title: json['title'],
//         description: json['description'],
//         status: json['status'],
//         data: json['data']);
//     return taskModel;
//   }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "status": status,
      TaskModelKeys.dateKey: date,
    };
  }
}

class TaskModelKeys {
  static String dateKey = "date";
}
