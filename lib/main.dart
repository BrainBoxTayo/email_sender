import 'package:email_sender/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'firebase_options.dart';


void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  WebViewPlatform.instance = WebWebViewPlatform();
  //Remove # sign from url
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
