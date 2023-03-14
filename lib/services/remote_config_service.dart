import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';

class RemoteConfigService {
  static Future<void> setupRemoteConfig() async {
    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 0),
        minimumFetchInterval: const Duration(seconds: 0),
      ));
      await remoteConfig.ensureInitialized();
      await remoteConfig.fetchAndActivate();
    } on FirebaseException catch (e) {
      logs(e.message.toString());
    }
  }
}
