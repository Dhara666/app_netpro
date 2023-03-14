import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseAnalyticsService {
  static Future<void> firebaseLoginEvent({String? key, String? userName}) async {
    FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;
    try {
      await firebaseAnalytics.logAppOpen();
      await firebaseAnalytics.logEvent(name: key!, parameters: {
        'userName': userName,
      });
    } on FirebaseException catch (e) {
      debugPrint("Exception-->${e.message}");
    }
  }
}
