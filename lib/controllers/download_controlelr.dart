import 'package:get/get.dart';

class DownloadController extends GetxController {
  var downloadpercent = "0".obs;
  var catlist = [
    {
      "cat": "Animals",
      "url":
          "https://i.pinimg.com/474x/7b/a0/78/7ba0789ee46c52b64ad1435dbe8f5139.jpg"
    },    {"cat": "Nature", "url": "https://wallpapercave.com/wp/wp4788551.jpg"},

    {
      "cat": "Animal",
      "url":
          "https://i.pinimg.com/474x/7b/a0/78/7ba0789ee46c52b64ad1435dbe8f5139.jpg"
    },
    {"cat": "Nature", "url": "https://wallpapercave.com/wp/wp4788551.jpg"},
    {
      "cat": "Animal",
      "url":
          "https://i.pinimg.com/474x/7b/a0/78/7ba0789ee46c52b64ad1435dbe8f5139.jpg"
    },
    
  ];
  @override
  void onClose() {
    downloadpercent.value = "0";

    super.onClose();
  }
}
