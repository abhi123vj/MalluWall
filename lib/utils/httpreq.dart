import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpServices {
  static var httpClient = http.Client();
  static final url = "https://malluwall.herokuapp.com/";

  static Future  fetchWallpapers() async {
 final Uri restAPIURL = Uri.parse(url);
    http.Response response = await httpClient.get(restAPIURL);
    final Map parseData = await json.decode(response.body.toString());

    if (response.statusCode == 200) {
      return parseData['wallpaper'];
    } else {
      print("Response errr ");
      return null;
    }
  }
}