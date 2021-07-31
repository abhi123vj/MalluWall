import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiReq extends GetxController{
  final httpClient = http.Client();
  final url = "https://malluwall.herokuapp.com/";

  List<dynamic> wallpaers = [].obs;
  Map<String, String> customHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json;charset=UTF-8"
  };
  Future fetchData() async {
    final Uri restAPIURL = Uri.parse(url);
    http.Response response = await httpClient.get(restAPIURL);
    final Map parseData = await json.decode(response.body.toString());
    wallpaers = parseData['wallpaper'];
  }
}
