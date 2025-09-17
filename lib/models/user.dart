class User {
  final String uid;
  final String? username;
  final String email;
  final String? photoUrl;

  const User({
    required this.uid,
    required this.email,
    this.username,
    this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['id'].toString(),
      email: json['email'] as String,
      username: json['username'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'photoUrl': photoUrl,
    };
  }
}
