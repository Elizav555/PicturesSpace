import '../../domain/model/app_user.dart';
import '../../domain/model/post.dart';
import '../model/user_db.dart';

class UsersMapper {
  static UserDb mapUserToDb(AppUser user) => UserDb(
      name: user.name,
      email: user.email,
      postsIds: user.posts.map((post) => post.id).whereType<String>().toList());

  static AppUser mapUserFromDb(String id, UserDb userDb, List<Post> posts) =>
      AppUser(id: id, name: userDb.name, email: userDb.email, posts: posts);
}
