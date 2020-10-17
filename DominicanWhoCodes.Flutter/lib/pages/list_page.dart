import 'dart:async';
import 'dart:convert';

import 'package:dominican_who_codes/providers/cardType1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Developer {
  final String name;
  final String initials;
  final String summary;
  final String skills;
  final String image;
  final String linkedin;
  final String github;
  final String twitter;
  final String webpage;

  Developer(
      {this.name,
      this.initials,
      this.summary,
      this.skills,
      this.image,
      this.linkedin,
      this.github,
      this.twitter,
      this.webpage});

  factory Developer.fromJson(Map<String, dynamic> json) {
    return Developer(
      name: json['name'],
      initials: json['initials'],
      summary: json['summary'],
      skills: json['skills'],
      linkedin: json['linkedin'],
      image: json['image'],
      github: json['github'],
      twitter: json['twitter'],
      webpage: json['webpage'],
    );
  }
}

class DevsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Developer>>(
      future: _fetchDevs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Developer> data = snapshot.data;
          return _devsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Developer>> _fetchDevs() async {
    final devsListAPIUrl =
        'http://dominicanwhocodes.azurewebsites.net/data/developers.json';
    final response = await http.get(devsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      var listToReturn = jsonResponse
          .map((dev) => new Developer.fromJson(dev))
          .toList()
            ..shuffle();
      return listToReturn;
    } else {
      throw Exception('Failed to load developers from API');
    }
  }

  ListView _devsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return CardType1(data[index]);
          //_tile(data[index].name, data[index].skills, Icons.work);
        });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
}
