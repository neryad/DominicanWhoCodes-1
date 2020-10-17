import 'package:dominican_who_codes/providers/launch_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget CardType1(data) {
  String name = '';
  String initials = '';
  String summary = '';
  String skills = '';
  String image = '';
  String linkedin = '';
  String github = '';
  String twitter = '';
  String webpage = '';

  name = data.name;
  initials = data.initials;
  summary = data.summary;
  skills = data.skills;
  image = data.image;
  linkedin = data.linkedin;
  github = data.github;
  twitter = data.twitter;
  webpage = data.webpage;

  final card = Container(
    // clipBehavior: Clip.antiAlias,
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: FadeInImage(
            image: NetworkImage(
                'http://dominicanwhocodes.azurewebsites.net/$image'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 150.0,
            width: 300.0,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          alignment: FractionalOffset.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  child: Text(
                    initials,
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  backgroundColor: Colors.black26,
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(name,
                      style: TextStyle(color: Colors.black, fontSize: 25.0))),
            ],
          ),
        ),
        Container(
          height: 44.0,
          child: ListView(
              scrollDirection: Axis.horizontal, children: _skillList2(skills)),
        ),
        Container(
            padding: EdgeInsets.all(10.0),
            child: Wrap(children: [
              Text(summary,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 18.0)),
            ])),

        // Row(children: [
        //   webpageset(webpage, 'webpage'),
        //   webpageset(linkedin, 'linkedin'),
        //   webpageset(twitter, 'twitter'),
        //   webpageset(github, 'github'),
        // ]),
        webpageset(webpage, 'webpage'),
        webpageset(linkedin, 'linkedin'),
        webpageset(twitter, 'twitter'),
        webpageset(github, 'github'),
        // _externalLinks(, linkedin, twitter, github),
      ],
    ),
  );

  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0))
        ]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
  );
}

List<RaisedButton> _skillList2(skills) {
  List<String> lst = skills.split(",");
  var listSkills = new List<RaisedButton>();
  lst.forEach((element) {
    listSkills.add(RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        // side: BorderSide(color: Colors.red)
      ),
      onPressed: null,
      child: Text(
        element,
        style: TextStyle(color: Colors.white),
      ),
    ));
  });
  return listSkills;
}

Widget webpageset(String webpage, String icon) {
  var wd = ListTile();
  if (webpage != null) {
    wd = ListTile(
      leading: Image.asset(
        'assets/$icon.png',
        width: 35,
        height: 35,
      ),
      subtitle: Text(''),
      title: Text(''),
      onTap: launcherUrl(webpage),
    );
  }

  return wd;
}

List<Widget> _externalLinks(webpage, linkedin, twitter, github) {
  var listSkills = new List<Card>();

  //if (webpage != '') {
  listSkills.add(
    Card(
      child: ListTile(
        title: Text('One-line with trailing widget'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
    // ListTile(
    //   leading: Image.asset(
    //     'assets/fb.png',
    //     width: 35,
    //     height: 35,
    //   ),
    //   title: Text('x'),
    //   onTap: facebook,
    // ),
  );
  //}

  return listSkills;
}

launcherUrl(String url) {
  psLaunch(url);
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      // forceWebView: true
    );
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

List<Widget> _skillList(skills) {
  List<String> lst = skills.split(",");
  var listSkills = new List<ClipRRect>();
  lst.forEach((element) {
    listSkills.add(ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
          height: 60,
          width: 60,
          color: Colors.black26, //.gray.fromRGBO(52, 58, 64, 0),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                element,
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ))),
    ));
  });
  return listSkills;
}
