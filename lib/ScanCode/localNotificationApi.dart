import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
class NotificationApi{
  static final _notifications = FlutterLocalNotificationsPlugin();
  
  static final onNotifications = BehaviorSubject<String?>();

  static Future notificationDetails() async{

    return  NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id', 
        'channel name',
        'channel description',
        importance: Importance.max
        ),
      iOS: IOSNotificationDetails()
    );
  }

  initState() {
  
   var initializationSettingsAndroid =
       AndroidInitializationSettings('nafa_splash');
   var initializationSettingsIOS = IOSInitializationSettings();
   var initializationSettings = InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIOS);
   _notifications.initialize(initializationSettings,
       onSelectNotification: (payload) async{
            onNotifications.add(payload);
       });
 }
    

  static Future showNotification({
    
    int id = 0,
    String? title,
    String? body,
    String? paylod,
    
  }) async => 
            _notifications.show(
              id, 
              title, 
              body, 
              await notificationDetails(),
              payload: paylod
              
              );


}