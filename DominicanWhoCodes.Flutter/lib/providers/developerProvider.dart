import 'package:http/http.dart' as http;
import 'package:dominican_who_codes/models/developerModel.dart';

class ApiServices {
  final apiUrl =
      'http://dominicanwhocodes.azurewebsites.net/data/developers.json';

  var developer;

  Future<List<Developer>> getProducts() async {
    final res = await http.get(apiUrl);
    developer = developerFromJson(res.body);
    return developer;
    }
}
