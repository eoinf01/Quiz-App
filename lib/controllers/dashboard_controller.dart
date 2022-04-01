 import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

 class dashboardController extends GetxController with GetSingleTickerProviderStateMixin{

   late RxString username;
   final box = GetStorage();
   @override
   void onInit() {
     super.onInit();
     username = box.read("username").toString().obs;
     box.listenKey("username", (value) {
       print("value changed");
       username.value = value;
     });
   }

   @override
   void onClose() {
     super.onClose();
   }
 }