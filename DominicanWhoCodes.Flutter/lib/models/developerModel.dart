import 'dart:convert';

// Developer developerFromJson(String str) => Developer.fromJson(json.decode(str));

// String developerToJson(Developer data) => json.encode(data.toJson());

List<Developer> developerFromJson(String str) =>
    List<Developer>.from(json.decode(str).map((x) => Developer.fromJson(x)));

String developerToJson(List<Developer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Developer {
  Developer({
    this.name,
    this.initials,
    this.image,
    this.summary,
    this.skills,
    this.linkedin,
    this.github,
    this.twitter,
  });

  String name;
  String initials;
  String image;
  String summary;
  String skills;
  String linkedin;
  String github;
  String twitter;

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        name: json["name"],
        initials: json["initials"],
        image: json["image"],
        summary: json["summary"],
        skills: json["skills"],
        linkedin: json["linkedin"],
        github: json["github"],
        twitter: json["twitter"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "initials": initials,
        "image": image,
        "summary": summary,
        "skills": skills,
        "linkedin": linkedin,
        "github": github,
        "twitter": twitter,
      };
}
