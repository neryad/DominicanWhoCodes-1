import 'package:flutter/material.dart';

import 'package:dominican_who_codes/pages/home_page.dart';
import 'package:dominican_who_codes/pages/listview_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'list': (BuildContext context) => ListPage(),
  };
}
