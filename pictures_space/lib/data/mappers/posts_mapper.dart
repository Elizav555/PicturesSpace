import 'package:pictures_space/data/model/post_db.dart';

import '../../domain/model/post.dart';

class PostsMapper {
  static PostDb mapPostToDb(Post post) => PostDb(
      time: post.time.toString(),
      desc: post.desc,
      imageUrl: post.imageUrl,
      usersLiked: post.usersLiked);

  static Post mapPostFromDb(String id, PostDb postDb) => Post(
      time: DateTime.parse(postDb.time),
      desc: postDb.desc,
      imageUrl: postDb.imageUrl,
      usersLiked: postDb.usersLiked,
      id: id);
}
