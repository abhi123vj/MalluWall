import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malluwall/controllers/download_controlelr.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:wallpaper/wallpaper.dart';

class SettWall {
  static Stream<String>? progressString;

  static homewall(var _url) {
    final downloadController = Get.put(DownloadController());

    progressString = Wallpaper.ImageDownloadProgress(_url);
    progressString!.listen((data) {
      downloadController.downloadpercent.value = data;
      print("DataReceived: " + data);
    }, onDone: () async {
      downloadController.downloadpercent.value = "0";
      await Wallpaper.homeScreen();

      MoveToBackground.moveTaskToBack();

      print("Task Done");
    }, onError: (error) {
      print("Some Error");
    });
  }

  static lockwall(var _url) {
    final downloadController = Get.put(DownloadController());

    progressString = Wallpaper.ImageDownloadProgress(_url);
    progressString!.listen((data) {
      downloadController.downloadpercent.value = data;
      print("DataReceived: " + data);
    }, onDone: () async {
      downloadController.downloadpercent.value = "0";
      await Wallpaper.homeScreen();

      MoveToBackground.moveTaskToBack();

      print("Task Done");
    }, onError: (error) {
      print("Some Error");
    });
  }

  static bothwall(var _url) {
    final downloadController = Get.put(DownloadController());

    progressString = Wallpaper.ImageDownloadProgress(_url);
    progressString!.listen((data) {
      downloadController.downloadpercent.value = data;
      print("DataReceived: " + data);
    }, onDone: () async {
      downloadController.downloadpercent.value = "0";
      await Wallpaper.bothScreen();

      MoveToBackground.moveTaskToBack();

      print("Task Done");
    }, onError: (error) {
      print("Some Error");
    });
  }
}
