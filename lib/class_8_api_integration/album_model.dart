class AlbumModel {
  //variables
  int userId;
  int id;
  String title;

  //constructor -> create object
  AlbumModel({required this.userId, required this.id, required this.title});

  //JSON -> Dart object -> Deserialization
  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  //Dart object -> Json ->Serialization
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
