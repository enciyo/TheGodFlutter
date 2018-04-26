import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class showMap{


  static Future<Null> launchbrowser(String long,String lati) async {
    String mapURl="https://maps.google.com/maps/dir//$long,$lati/";
    await launch(mapURl, forceSafariVC: false, forceWebView: false);
  }

}