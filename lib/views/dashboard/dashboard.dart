import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:theorytest/views/dashboard/nav/nav_bar.dart';
import 'package:theorytest/views/dashboard/screens/home/home.dart';
import 'package:theorytest/views/dashboard/screens/modes/modes.dart';
import 'package:theorytest/views/dashboard/screens/settings.dart';

import '../../main.dart';

class MyDashBoard extends StatefulWidget {

  @override
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) async {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if(notification != null && android != null){
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                    channel.id,
                    channel.name,
                    color: Colors.blue,
                    playSound: true,
                    icon: '@mipmap/ic_launcher',
                    importance: Importance.max
                ),
              ));
        }
      },
    );

    FirebaseMessaging.onMessage.listen(
          (message) async {
        print("notification recevied");
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if(notification != null && android != null){
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                    channel.id,
                    channel.name,
                    color: Colors.blue,
                    playSound: true,
                    icon: '@mipmap/ic_launcher',
                    importance: Importance.max
                ),
              ));
        }
      },
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: NavBarV1(
          onItemSelected: (index) => {
            setState(() => _currentIndex = index),
          },
          selectedIndex: _currentIndex,
        )
    );
  }


  Widget getBody() {
    List<Widget> pages = [
      HomeScreen(),
      modeScreen(),
      Settings()
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages
    );
  }


}