import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:malluwall/controllers/download_controlelr.dart';
import 'package:malluwall/utils/apirequests.dart';
import 'package:malluwall/utils/prolaucher.dart';
import 'package:malluwall/utils/setwallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SelectedWall extends StatelessWidget {
  SelectedWall({Key? key}) : super(key: key);
  final apireqst = Get.put(ApiReq());
  final downloadController = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final index = Get.arguments;
    return Material(
      child: Stack(children: [
        Container(
          height: screenHeight,
          width: screenWidth,
          child: CachedNetworkImage(
            imageUrl: apireqst.wallpaerlist.first["lowImageUrl"],
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
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
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: screenWidth,
                height: screenHeight * .1,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          apireqst.wallpaerlist[index]["userName"],
                        ),
                        OutlinedButton(
                            onPressed: () {
                              ProfileLauncher.launchURL(
                                apireqst.wallpaerlist[Get.arguments]
                                    ["instaUrl"],
                              );
                            },
                            child: Text("Follow")),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        ///top
        Positioned(
          top: 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: screenWidth,
                height: screenHeight * .1,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.blue,
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(FontAwesomeIcons.arrowLeft)),
                                GestureDetector(
                                  onTap: () {
                                    Get.offAndToNamed(
                                      "/setwall",
                                      arguments:
                                          apireqst.wallpaerlist[Get.arguments]
                                              ["highImageUrl"],
                                    );
                                  },
                                  child: Text(
                                    "SET WALLPAPER",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
