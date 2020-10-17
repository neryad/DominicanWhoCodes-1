import 'dart:async';

class PsCustomTheme {
  dynamic psController = StreamController<bool>();
  get psChange => psController.sink.add;
  get psDarkTheme => psController.stream;
}

final psCustomTheme = PsCustomTheme();
