import 'dart:async';
import 'dart:convert';

import 'package:dominican_who_codes/models/developerModel.dart';
import 'package:dominican_who_codes/providers/cardType1.dart';
import 'package:dominican_who_codes/providers/developerProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class Developer {
//   final String name;
//   final String initials;
//   final String summary;
//   final String skills;
//   final String image;
//   final String linkedin;
//   final String github;
//   final String twitter;
//   final String webpage;

//   Developer(
//       {this.name,
//       this.initials,
//       this.summary,
//       this.skills,
//       this.image,
//       this.linkedin,
//       this.github,
//       this.twitter,
//       this.webpage});

//   factory Developer.fromJson(Map<String, dynamic> json) {
//     return Developer(
//       name: json['name'],
//       initials: json['initials'],
//       summary: json['summary'],
//       skills: json['skills'],
//       linkedin: json['linkedin'],
//       image: json['image'],
//       github: json['github'],
//       twitter: json['twitter'],
//       webpage: json['webpage'],
//     );
//   }
// }

class DevsListView extends StatelessWidget {
  List<Developer> developer = [];
  var apiService = new ApiServices();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Developer>>(
      future: apiService.getProducts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            //backgroundColor: Colors.black,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
          ));
        }
        developer = snapshot.data;
        if (developer.length == 0) {
          return Center(
            child: Text('No data'),
          );
        }

        return ListView.builder(
            itemCount: developer.length,
            itemBuilder: (context, index) => _card(developer[index]));
        // if (snapshot.hasData) {
        //   developer = snapshot.data;
        //   return _devsListView(developer);
        // } else if (snapshot.hasError) {
        //   return Text("${snapshot.error}");
        // }
        // return CircularProgressIndicator();
      },
    );
  }

  // Future<List<Developer>> _fetchDevs() async {
  //   final devsListAPIUrl =
  //       'http://dominicanwhocodes.azurewebsites.net/data/developers.json';
  //   final response = await http.get(devsListAPIUrl);
  //   print(response);

  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     var listToReturn = jsonResponse
  //         .map((dev) => new Developer.fromJson(dev))
  //         .toList()
  //           ..shuffle();
  //     return listToReturn;
  //   } else {
  //     throw Exception('Failed to load developers from API');
  //   }
  // }

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

Widget _card(Developer developer) {
  return Expanded(
    child: Container(
      color: Colors.white,
      height: 210.00,

      //width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.black38,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'http://dominicanwhocodes.azurewebsites.net/data/devs-pics/luis-pujols.png'),
                  radius: 50.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(developer.name),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          buildTags(developer.skills
                        )
                      ]),
                ),
              ), // Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Text(develope),
              //     ]),
            ],
          ),
        ),
      ),
    ),
  );
}

List<Widget> buildTags(developer) {

     List<Widget> tags = <Widget>[];

    for(int i = 0; i < developer.length; i++) {

      tags.add(createTag(i, developer.tags[i]));

    }

    return tags;

  }

    Widget createTag(int index, String tagTitle) {

    return InkWell(

      onTap: () {

        setState(() {

          //TODO: Handle tag selection

          selectedTagIndex = index;

        });

      },

      child: Chip(

        backgroundColor:  widget.tagBackgroundColor,

        label: widget.tagTitle == null ? Text(tagTitle) : widget.tagTitle(tagTitle),

        deleteIcon:  Icon(Icons.cancel),

        onDeleted: widget.deletableTag ? () {

          if(widget.deletableTag)

            deleteTag(index);

        } : null,

      ),

    );

  }