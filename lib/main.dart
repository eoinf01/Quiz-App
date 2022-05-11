import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:theorytest/themes.dart';
import 'package:theorytest/views/categories/categories.dart';
import 'package:theorytest/views/onboard/onboarding.dart';
import 'package:theorytest/views/quizzes/components/score_screen.dart';
import 'package:theorytest/views/statistics/statistics.dart';

bool? onboarding;

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title// description
    importance: Importance.max,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await GetStorage.init();
  final box = GetStorage();
  box.write("onboarding", false);
  onboarding = box.read("onboarding");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/blob-scene-haikei-4.png"), context);
    precacheImage(AssetImage("assets/alarm.png"), context);
    precacheImage(AssetImage("assets/law.png"), context);
    precacheImage(AssetImage("assets/low-poly-grid-haikei.png"), context);
    precacheImage(AssetImage("assets/blob-scene-haikei-3.png"), context);
    precacheImage(AssetImage("assets/bg.png"), context);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: iOSTheme.lightTheme,
      home: onboarding == true ? NewOnboard(): NewOnboard(),
    );
  }
}
