import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malluwall/utils/apirequests.dart';

class HomeView extends StatelessWidget {
  final apireqst = Get.put(ApiReq());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      // child: Center(child:
      // ElevatedButton(
      //   onPressed: (){
      //    apireqst.fetchData().then((value) => print(apireqst.wallpaers.first["highImageUrl"]));
      //   },
      //   child: Text("homei")),),
      child: Container(
          child: Column(
        children: [
          ElevatedButton(
            child: Text("Relaod"),
            onPressed: () {
              apireqst
                  .fetchWallpapers()
                  .then((value) => print(apireqst.wallpaerlist.length));
            },
          ),
          Expanded(
            child: FutureBuilder(
              builder: (context, projectSnap) {
                if (projectSnap.connectionState == ConnectionState.none) {
                  print('project snapshot data is: ${projectSnap.data}');
                  return Container();
                }
                return Obx(() => GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 9 / 18,mainAxisSpacing: 5,crossAxisSpacing: 5),
                      itemCount: apireqst.wallpaerlist.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            
                          },
                          child: Container(
                            child: Image.network(
                              apireqst.wallpaerlist[index]["highImageUrl"],
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        );
                      },
                    ));
              },
              future: apireqst.fetchWallpapers(),
            ),
          ),
        ],
      )),
    );
  }
}
