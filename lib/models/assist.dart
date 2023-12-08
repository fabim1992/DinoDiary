import 'package:dino_diary/models/user.dart';

class AssistantsList {
  final List<User> assistants;

  AssistantsList({required this.assistants});

  factory AssistantsList.fromJson(Map<String, dynamic> json) {
    List<dynamic> assistantsList = json['assistants'] as List<dynamic>;
    List<User> assistants =
        assistantsList.map((user) => User.fromJson(user)).toList();

    return AssistantsList(assistants: assistants);
  }
}

class AssistedUsersList {
  final List<User> assistedUsers;

  AssistedUsersList({required this.assistedUsers});

  factory AssistedUsersList.fromJson(Map<String, dynamic> json) {
    List<dynamic> assistedUsersList = json['assistedUsers'] as List<dynamic>;
    List<User> assistedUsers =
        assistedUsersList.map((user) => User.fromJson(user)).toList();

    return AssistedUsersList(assistedUsers: assistedUsers);
  }
}
