class Comment {
  int id;
  int postId;
  String name;
  String email;
  String body;

  Comment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}