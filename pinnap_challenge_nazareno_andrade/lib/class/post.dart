class Post{
  int id;
  int userId;
  String title;
  String body;
  bool like;
  int likeNumber;
  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.like,
    required this.likeNumber
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
      like: false,
      likeNumber: 12,
    );
  }
}