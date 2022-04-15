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

   double get getRapidBest => this.rapidBestScore;
   double get getMarathonBest => this.marathonBestScore;

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
     rapidBestScore = rapidScores.reduce(max);
     marathonBestScore = marathonScores.reduce(max);

     scrollController = new ScrollController();
   }

   @override
   void onClose() {
     super.onClose();
     scrollController.dispose();
   }
 }