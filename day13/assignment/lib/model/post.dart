class Post {
  int userId;
  int id;
  String title;
  String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

// serialization을 할 factory 함수 => map을 주면 Post를 던져주는 from.Map이라는 생성자.
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}
