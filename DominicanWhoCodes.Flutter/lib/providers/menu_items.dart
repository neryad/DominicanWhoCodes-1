import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'launch_url.dart';

class _MenuItems {
  Widget items;

  _MenuItems();

  Future<Widget> itemsFromMenu() async {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Starling Germosen'),
          accountEmail: Text("sgermosen@praysoft.net"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://1.bp.blogspot.com/-Hwa1atOFM2c/W48C3pwTvhI/AAAAAAAAFf8/X7I1u-EEMy0HSnK5RWww_kgwRlAFvSXeQCLcBGAs/s1600/23745678.jpg'),
          ),
        ),
        ListTile(
          leading: Text("Dark Mode"),
          // trailing:
          //     Switch(value: referencer.data, onChanged: psCustomTheme.psChange),
        ),
        ListTile(
          leading: Text("Go to the Website"),
          trailing: Icon(Icons.link),
          onTap: website,
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            "Follow Me",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        ListTile(
          leading: Image.asset(
            'assets/fb.png',
            width: 35,
            height: 35,
          ),
          title: Text('Facebook'),
          onTap: facebook,
        ),
        ListTile(
          leading: Image.asset(
            'assets/tweet.png',
            width: 35,
            height: 35,
          ),
          title: Text('Twitter'),
          onTap: twitter,
        ),
        ListTile(
          leading: Image.asset(
            'assets/insta.png',
            width: 35,
            height: 35,
          ),
          title: Text('Instagram'),
          onTap: instagram,
        ),
        Divider(),
        ListTile(
          leading: Text("Share"),
          trailing: IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share('Download the app\n' + 'http://sgermosen.com');
              }),
        ),
      ],
    );
  }
}

final menuitems = new _MenuItems();
