class Member {
  final int id;
  final String login;
  final String avatarUrl;
  Member({this.id, this.login, this.avatarUrl});

  static final columns = ["id", "login", "avatarUrl"];

  factory Member.fromMap(Map<String, dynamic> data) {
    return Member(
      id: data["id"],
      login: data["login"],
      avatarUrl: data["avatarUrl"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "login": login,
      "avatarUrl": avatarUrl,
    };
  }
}