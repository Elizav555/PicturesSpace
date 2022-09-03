class UserDb {
  final String name;
  final String email;
  final List<String> postsIds;

  static const _kname = 'name';
  static const _kemail = 'email';
  static const _kpostsIds = 'postsIds';

  UserDb({required this.name, required this.email, this.postsIds = const []});

  factory UserDb.fromJSON(Map<String, dynamic> json) => UserDb(
      name: json[_kname]! as String,
      email: json[_kemail]! as String,
      postsIds: json[_kpostsIds] as List<String>);

  Map<String, Object?> toJSON() =>
      {_kname: name, _kemail: email, _kpostsIds: postsIds};
}
