import 'package:dominican_who_codes/pages/list_page.dart';
import 'package:dominican_who_codes/providers/launch_url.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';

import 'package:dominican_who_codes/providers/menu_provider.dart';
import 'package:dominican_who_codes/utils/icono_string_util.dart';
import 'package:dominican_who_codes/utils/ps_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: false,
      stream: psCustomTheme.psDarkTheme,
      builder: (context, referencer) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: referencer.data ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          drawer: Drawer(
            child: _itemsFromMenu(referencer),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "DominicanWho.Codes", style: TextStyle(color: Colors.white),
              // style: GoogleFonts.bungee(),
            ),
          ),
          body: DevsListView(),
        ),
      ),
    );
  }

  Widget _listItems() {
    // menuProvider.cargarData()
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  Widget _itemsFromMenu(referencer) {
    return ListView(
      children: <Widget>[
        // UserAccountsDrawerHeader(
        //   accountName: Text('Starling Germosen'),
        //   accountEmail: Text("sgermosen@praysoft.net"),
        //   currentAccountPicture: CircleAvatar(
        //     backgroundImage: NetworkImage(
        //         'https://1.bp.blogspot.com/-Hwa1atOFM2c/W48C3pwTvhI/AAAAAAAAFf8/X7I1u-EEMy0HSnK5RWww_kgwRlAFvSXeQCLcBGAs/s1600/23745678.jpg'),
        //   ),
        // ),
        ListTile(
          leading: Text("Dark Mode"),
          trailing:
              Switch(value: referencer.data, onChanged: psCustomTheme.psChange),
        ),
        ListTile(
          leading: Text("Go to the Website"),
          trailing: Icon(Icons.link),
          onTap: website,
        ),
        // Divider(),
        // Padding(
        //   padding: const EdgeInsets.only(left: 15.0),
        //   child: Text(
        //     "Follow Me",
        //     style: TextStyle(fontWeight: FontWeight.bold),
        //   ),
        // ),
        // Divider(),
        // ListTile(
        //   leading: Image.asset(
        //     'assets/fb.png',
        //     width: 35,
        //     height: 35,
        //   ),
        //   title: Text('Facebook'),
        //   onTap: facebook,
        // ),
        // ListTile(
        //   leading: Image.asset(
        //     'assets/tweet.png',
        //     width: 35,
        //     height: 35,
        //   ),
        //   title: Text('Twitter'),
        //   onTap: twitter,
        // ),
        // ListTile(
        //   leading: Image.asset(
        //     'assets/insta.png',
        //     width: 35,
        //     height: 35,
        //   ),
        //   title: Text('Instagram'),
        //   onTap: instagram,
        // ),
        // Divider(),
        ListTile(
          leading: Text("Nominate"),
          trailing: IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share('Download the app\n' + 'http://sgermosen.com');
              }),
        ),
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

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['text']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['route']);

          // final route = MaterialPageRoute(
          //   builder: ( context )=> AlertPage()
          // );

          // Navigator.push(context, route);
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
