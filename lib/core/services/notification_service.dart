import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  // final _fcm = FirebaseMessaging.instance;
  String? fcmToken;
  // final naivgator = locator<NavigationService>();
  // final dialogService = locator<DialogService>();

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  String userId = '';
  String mType = '';

  // final BehaviorSubject<ReceivedNotification>
  //     didReceivedLocalNotificationSubject =
  //     BehaviorSubject<ReceivedNotification>();

  ///init local notification
  initFlutterLocalNotificationPlugin() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'default',
        'High Importance Notifications',
        importance: Importance.high,
        description: "This is Hooked Notification channel",
        playSound: true,
        enableLights: true,
      );
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      ///init android settings
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings("@mipmap/ic_launcher");

      ///init ios settings
      final DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            _onDidReceiveLocalNotification(
          id,
          title ?? "",
          body ?? "",
          payload ?? "",
        ),
      );

      ///init settings
      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      ///init local notification plugin
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        // onDidReceiveNotificationResponse: (payload) async =>
        // _onNotificationClick(payload),
      );

      ///create channel
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      ///set options
    }
  }

  ///
  ///Initializing Notification services that includes FLN, ANDROID NOTIFICATION CHANNEL setting
  ///FCM NOTIFICATION SETTINGS, and also listeners for OnMessage and for onMessageOpenedApp
  ///
  initConfigure() async {
    debugPrint("@initFCMConfigure/started");
    await initFlutterLocalNotificationPlugin();
    // askPermission();

    ///now finally get the token from

    ///
    /// When the app is in terminated state and user clicks on notification
    ///

    ///
    /// When app is in foreground state and user receives notification
    ///

    ///
    /// When app is in background(opened) and user clicks on notification
    ///
  }

  /// get fcm token

  handleNotification( message) {
    debugPrint('@handleNotification');
    // _setMessageType(message);
    // setNotificationDotStatus(true);
    showLocalNotification(message.notification!);
  }

  ///  set incomming message type

  /// Route to relevant screen
  _goToRelevantScreen() {
    // naivgator.navigateToRootView(selectedIndex: 2);

    // setNotificationDotStatus(false);
    // if (type == 'like') {
    //   debugPrint('Going to notification screen...');
    //   _goToNotificationScreen();
    // } else {
    //   _goToOrderDetailsScreen();
    //   // ...
    // }
  }

  // void _goToNotificationScreen() {
  //   // GoRouter.of(getContext).go(AppRoutes.notification);
  // }

  // void _goToOrderDetailsScreen() {
  //   // GoRouter.of(getContext).go(AppRoutes.previousOrders,
  //   //     extra: {'isCameFromeNotification': false});
  // }

  /// show local notification (Heads up notification)
  void showLocalNotification(notification) {
    debugPrint("@_showLocalNotification");
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        iOS: DarwinNotificationDetails(subtitle: channel.description),
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          onlyAlertOnce: true,
          importance: Importance.max,
          priority: Priority.high,
          channelDescription: channel.description,
          icon: "@mipmap/ic_launcher",
          // actions: [
          //   AndroidNotificationAction(
          //     'action_view',
          //     'Like',
          //     showsUserInterface: true,
          //   ),
          //   AndroidNotificationAction(
          //     'action_view',
          //     'DisLike',
          //     showsUserInterface: true,
          //   ),
          // ],
          styleInformation: BigTextStyleInformation(
            notification.body ?? 'Body Text',
            contentTitle: notification.title ?? 'Title Text',
          ),
        ),
      ),
    );
  }

  void _onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    ReceivedNotification receivedNotification = ReceivedNotification(
        id: id, title: title, body: body, payload: payload);
    // didReceivedLocalNotificationSubject.add(receivedNotification);
  }

  /// Executes when user clicks on notification in foreground state

  /// set notification dot status
  // void setNotificationDotStatus(bool status) {
  //   // locator<LocalStorageService>().setNotificationsStatus = status;
  //   notificationDotNotifier.value = status;
  //   // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  //   notificationDotNotifier.notifyListeners();
  // }
}

//define a global variable for notification count
// ValueNotifier<bool> notificationDotNotifier =
//     ValueNotifier(locator<LocalStorageService>().getNotificationsStatus);

///
///received notification model class for ios didNotificationReceived callback
///
class ReceivedNotification {
  final int? id;
  final String? title;
  final String? body;
  final String? payload;

  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });
}
