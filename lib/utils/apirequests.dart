import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:malluwall/utils/httpreq.dart';

class ApiReq extends GetxController{
  final httpClient = http.Client();
  final url = "https://malluwall.herokuapp.com/";

  List<dynamic> wallpaerlist = [].obs;
  
  Map<String, String> customHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json;charset=UTF-8"
  };
 

  
  void onInit()  {
   fetchWallpapers();
    super.onInit();
  }
   Future fetchWallpapers() async {
    var wallpapers = await HttpServices.fetchWallpapers();
    if (wallpapers != null) {
      wallpaerlist.assignAll(wallpapers);
    }
  }
}
