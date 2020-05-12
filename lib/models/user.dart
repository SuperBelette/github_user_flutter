
class User {
  final String login;
  final String avatarUrl;
  final String url;

  User(this.login, this.avatarUrl, this.url);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['login'], json['avatar_url'], json['url']);
  }

}