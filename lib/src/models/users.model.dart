class User {
  String? utype;
  String user;
  String pass;
  String last;

  User(
      {this.utype, required this.user, required this.pass, required this.last});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        utype: json['utype'] ?? 'user',
        user: json['user'],
        pass: json['pass'],
        last: json['last']);
  }

  Map<String, dynamic> toJson() {
    return {'utype': utype, 'user': user, 'pass': pass, 'last': last};
  }
}
