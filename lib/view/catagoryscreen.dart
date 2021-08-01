import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malluwall/constants/colors.dart';
import 'package:malluwall/controllers/download_controlelr.dart';

class CatScreen extends StatelessWidget {
   CatScreen({ Key? key }) : super(key: key);
    final downloadController = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 9 / 15,
                      ),
                      itemCount: downloadController.catlist.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed("/home", arguments: downloadController.catlist[index]["cat"]);
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
                                          downloadController.catlist[index]["url"]??"https://f.shgcdn.com/718b2dae-1d1c-4816-b434-1fc368efc31d/-/preview/-/inline/no/Topographical-iPhone.jpg",
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
                              ),
                            ),
                            Center(child: Text( downloadController.catlist[index]["cat"]??"Unknown"),)
                          ],
                        );
                      },
                    )),
      );
  
  }
}