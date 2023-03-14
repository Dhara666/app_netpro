import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/app/widget/app_toast.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsProvider extends ChangeNotifier {
  String googleMapUrl =
      'https://www.google.com/maps/dir//Food+Safety+and+Standards+Authority+of+India+(FSSAI)+FDA+Bhawan+Kotla+Marg,+near+Bal+Bhavan,+Mandi+House+New+Delhi,+Delhi+110002/@28.6324315,77.2353096,12z/data=!4m8!4m7!1m0!1m5!1m1!1s0x390d01315288861f:0xf036137df7286cd7!2m2!1d77.2353096!2d28.6324315';
  TextEditingController firstNmeController = TextEditingController();
  TextEditingController lastNmeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final Completer<GoogleMapController> googleMapController = Completer();

  final CameraPosition initialLocation =
      const CameraPosition(target: LatLng(28.6139, 77.2090), zoom: 9);

  void validateForm(context) {
    if (messageController.text.isEmpty) {
      S.of(context).messageCanNotBeEmpty.showSnackbar(context);
    } else {
      S.of(context).formValidated.showToast();
      disposeProvider();
    }
  }

  void onGoogleLink(String link) {
    link.urlLauncher(mode: LaunchMode.externalApplication);
  }

  void disposeProvider() {
    firstNmeController.clear();
    lastNmeController.clear();
    emailController.clear();
    subjectController.clear();
    messageController.clear();
  }
}
