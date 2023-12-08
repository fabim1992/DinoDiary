class Entry {
  final int id;
  final String title;
  final String content;
  final int userId;
  final String status;
  final Map<String, dynamic> configs;
  final String createdAt;
  final String updatedAt;

  Entry({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
    required this.status,
    required this.configs,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      userId: json['userId'] as int,
      status: json['status'] as String,
      configs: json['configs'] as Map<String, dynamic>,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}

class EntriesList {
  final List<Entry> entries;

  EntriesList({required this.entries});

  factory EntriesList.fromJson(Map<String, dynamic> json) {
    List<dynamic> entriesList = json['entries'] as List<dynamic>;
    List<Entry> entries =
        entriesList.map((entry) => Entry.fromJson(entry)).toList();

    return EntriesList(entries: entries);
  }
}
