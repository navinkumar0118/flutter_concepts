class AlbumDetail {
  int userId;
  int id;
  String title;

  AlbumDetail({required this.userId, required this.id, required this.title});

  //from json
  factory AlbumDetail.fromJson(Map<String, dynamic> json) =>
      AlbumDetail(userId: json['userId'], id: json["id"], title: json["title"]);

  //to json
  //Dart object -> Json ->Serialization
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
