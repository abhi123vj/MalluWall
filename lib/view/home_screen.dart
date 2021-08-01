
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malluwall/constants/colors.dart';
import 'package:malluwall/utils/apirequests.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeView extends StatelessWidget {
  final apireqst = Get.put(ApiReq());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     appBar: AppBar(title: Text("Cat"),elevation: 0,),
      body: Container(
          decoration: BoxDecoration(color: bgColor),
          child: FutureBuilder(
            builder: (context, snapshot) => snapshot.connectionState !=
                    ConnectionState.done
                ? Container(
                    color: Colors.blue,
                  )
                : Obx(() => GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 9 / 18,
                      ),
                      itemCount: apireqst.wallpaerlist.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed("/wall", arguments: index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(0)),
                            padding: EdgeInsets.all(5),
                            child: Material(
                              color:randomColor(),
                              borderRadius: BorderRadius.circular(15),
                              elevation: 3,
                              child: CachedNetworkImage(
                                imageUrl:
                                    apireqst.wallpaerlist.first["lowImageUrl"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (
                                  context,
                                  url,
                                ) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
            future: apireqst.fetchWallpapers(Get.arguments),
          )),
    );
  }
}
