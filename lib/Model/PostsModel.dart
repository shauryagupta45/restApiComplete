class PostsModel {
  int? userId;
  int? postId;
  String? title;
  String? body;

  PostsModel({this.userId, this.postId, this.title, this.body});

  PostsModel.fromJson(Map<dynamic, dynamic> json) {
    userId = json['userId'];
    postId = json['I'];
    title = json['title'];
    body = json['body'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['userId'] = this.userId;
    data['I'] = this.postId;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
