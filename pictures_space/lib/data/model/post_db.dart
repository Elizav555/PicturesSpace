class PostDb {
  final String time;
  final String desc;
  final String imageUrl;
  final List<String> usersLiked;

  static const _ktime = 'time';
  static const _kdesc = 'desc';
  static const _kimageUrl = 'imageUrl';
  static const _kusersLiked = 'usersLiked';

  PostDb(
      {required this.time,
      required this.desc,
      required this.imageUrl,
      this.usersLiked = const []});

  factory PostDb.fromJSON(Map<String, dynamic> json) => PostDb(
      time: json[_ktime]! as String,
      desc: json[_kdesc]! as String,
      imageUrl: json[_kimageUrl]! as String,
      usersLiked: json[_kusersLiked] as List<String>);

  Map<String, Object?> toJSON() => {
        _ktime: time,
        _kdesc: desc,
        _kimageUrl: imageUrl,
        _kusersLiked: usersLiked
      };
}
