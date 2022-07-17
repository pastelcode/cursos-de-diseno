class Course {
  const Course({
    required this.title,
    required this.youtubeLink,
  });

  final String title;
  final String youtubeLink;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        title: json["title"],
        youtubeLink: json["youtubeLink"],
      );
}
