import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse("https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fullscreen WebView
          Positioned.fill(
            child: WebViewWidget(controller: _controller),
          ),

          // Semi-transparent overlay for better contrast
          Container(
            color: Colors.black.withOpacity(0.7),
          ),

          // Centered text and button
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "404 - Page Not Found",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "But we found something better 😉",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 30),

                // Go Home Button
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Go Home",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
