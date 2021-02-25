import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'SecondPage.dart';
import 'globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final String oneSignalAppId = '0fc9206b-bea1-468f-a99e-6fa202f56e7e';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.init(
      oneSignalAppId,
      iOSSettings: {
        OSiOSSettings.autoPrompt: true,
        OSiOSSettings.inAppLaunchUrl: true
      },
    );

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    //This method only work when app is in foreground.
    OneSignal.shared.setNotificationReceivedHandler(
      (OSNotification notification) async {
        print('setNotificationReceivedHandler');
      },
    );

    OneSignal.shared.setNotificationOpenedHandler(
      (OSNotificationOpenedResult result) async {
        var data = result.notification.payload.additionalData;     
        globals.appNavigator.currentState.push(
          MaterialPageRoute(
            builder: (context) => SecondPage(
              postId: data['post_id'].toString(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wordpress OneSignal'),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Text("Push Notification"),
      ),
    );
  }
}
