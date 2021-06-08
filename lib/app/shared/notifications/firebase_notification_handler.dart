import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationHandler {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
        //chamada quando o aplicativo esta em segundo plano e recebe a notificacao
        onMessage: (Map<String, dynamic> message) async {
      print('onMessage: $message');
    },
        //chamado quando a aplicacao foi completamente fechada e é aberta pela notificacao
        onLaunch: (Map<String, dynamic> message) async {
      print('onLaunch: $message');
    },
        //chamado quando o app esta de background e é aberto pela notificacao
        onResume: (Map<String, dynamic> message) async {
      print('onResume: $message');
    });
  }
}
