import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malluwall/utils/apirequests.dart';

class HomeView extends StatelessWidget {
    final apireqst = Get.put(ApiReq());


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: 
      ElevatedButton(
        onPressed: (){
         apireqst.fetchData().then((value) => print(apireqst.wallpaers.first["highImageUrl"]));
        },
        child: Text("homei")),),
    );
  }
}