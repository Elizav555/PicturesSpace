class Post {
  String? id;
  final String time;
  final String desc;
  final String imageUrl;
  final List<String> usersLiked;

  Post(
      {required this.id,
      required this.time,
      required this.desc,
      required this.imageUrl,
      this.usersLiked = const []});

  Post.forAdd(
      {required this.time,
      required this.desc,
      required this.imageUrl,
      this.usersLiked = const []});
}
