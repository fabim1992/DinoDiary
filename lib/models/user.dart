class User {
  final int id;
  final String name;
  final String avatar;
  final String? email;
  final Map<String, dynamic>? configs;
  final String createdAt;

  User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.email,
    required this.configs,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      email: json['email'] as String?,
      configs: json['configs'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] as String,
    );
  }
}

class UsersList {
  final List<User> users;

  UsersList({required this.users});

  factory UsersList.fromJson(Map<String, dynamic> json) {
    List<dynamic> usersList = json['users'] as List<dynamic>;
    List<User> users = usersList.map((user) => User.fromJson(user)).toList();

    return UsersList(users: users);
  }
}
