import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotificationApp(),
    );
  }
}

class NotificationApp extends StatefulWidget {
  const NotificationApp({Key? key}) : super(key: key);

  @override
  State<NotificationApp> createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {
  FlutterLocalNotificationsPlugin? localNotification;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    var iOSIntialize = new IOSInitializationSettings();
    var initialzationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSIntialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification!.initialize(initialzationSettings);
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
      "channelId",
      "Local Notification",
      channelDescription: "This is Sina from United Group",
      playSound: true,
      priority: Priority.high,
      importance: Importance.high,
    );

    var iosDetails = new IOSNotificationDetails();
    var generalNotifications =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNotification!.show(0, "Notification",
        "This is Sina from United Group", generalNotifications);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Click the button to recieve a notification"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNotification,
        child: Icon(Icons.notifications),
      ),
    );
  }
}
