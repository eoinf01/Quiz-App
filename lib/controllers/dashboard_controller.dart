 import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

 class dashboardController extends GetxController with GetSingleTickerProviderStateMixin{

   late RxString username;
   final box = GetStorage();
   late ScrollController scrollController;
   late double rapidBestScore;
   late double marathonBestScore;
   late double favBestScore;
   int touchedIndex = 0;
   String dropdownValue = "practice";
   late List<double> practiceData;
   late List<double> rapidData;
   late List<double> marathonData;

   double get getRapidBest => this.rapidBestScore;
   double get getMarathonBest => this.marathonBestScore;
   double get getFavBestScore => this.favBestScore;

   @override
   void onInit() {
     super.onInit();
     username = box.read("username").toString().obs;
     box.listenKey("username", (value) {
       username.value = value;
     });

     Map scores = box.read("scores");
     List<double> rapidScores = List.from(scores["rapid"]);
     List<double> marathonScores = List.from(scores["marathon"]);
     List<double> favScores = List.from(scores["favourites"]);
     rapidBestScore = rapidScores.reduce(max);
     marathonBestScore = marathonScores.reduce(max);
     favBestScore = favScores.reduce(max);
     scrollController = new ScrollController();

     Map og = box.read("scores");
     practiceData = og["practice"];
     rapidData = og["rapid"];
     marathonData = og["marathon"];

     box.listenKey("scores", (value) {
       practiceData = value["practice"];
       rapidData = value["rapid"];
       marathonData = value["marathon"];
       update();
     });

   }
   @override
   void onClose() {
     super.onClose();
     scrollController.dispose();
   }
   void updateTouchIndex(int index){
     touchedIndex = index;
     print(touchedIndex);
     update();
   }
 }