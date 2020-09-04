class User {
  String user;
  String password;

  User(this.user, this.password);
  User.fromMap(Map<String, dynamic> map) {
    this.user = map['user'];
    this.password = map['password'];
  }
  User.copy(User newUser) {
    this.user = newUser.user;
    this.password = newUser.password;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['user'] = this.user;
    map['password'] = this.password;
    return map;
  }
}
