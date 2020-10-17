import 'package:url_launcher/url_launcher.dart';

website() {
  psLaunch('https://sgermosen.com');
}

facebook() {
  psLaunch('https://facebook.com/sgermosen24');
}

twitter() {
  psLaunch('https://twitter.com/sgrysoft');
}

instagram() {
  psLaunch('https://instagram.com/sgermosen24');
}

psLaunch(String urlString) async {
  if (await canLaunch(urlString)) {
    await launch(urlString);
  } else {
    throw 'Can not launch Url';
  }
}
