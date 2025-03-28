// import 'dart:async';
// import 'package:email_sender/common/widgets/loaders/loaders.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// /// Manages the network connectivity status and provides methods to check and handle connectivity changes.
// class NetworkManager extends GetxController {
//   static NetworkManager get instance => Get.find();

//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
//   final _connectionStatus = <ConnectivityResult>[ConnectivityResult.none].obs;

//   /// Initialize the network manager and set up a stream to continually check the connection status.
//   @override
//   void onInit() {
//     super.onInit();
//     _initializeConnectionStatus();
//     _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   /// Initialize the current connection status.
//   Future<void> _initializeConnectionStatus() async {
//     List<ConnectivityResult> result = await _connectivity.checkConnectivity();
//     _updateConnectionStatus(result);
//   }

//   /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
//   void _updateConnectionStatus(List<ConnectivityResult> result) {
//     _connectionStatus.value = result;
//     if (_connectionStatus.contains(ConnectivityResult.none)) {
//       CustomLoaders.warningSnackBar(title: 'No Internet Connection');
//     }
//   }

//   /// Check the internet connection status.
//   /// Returns `true` if connected, `false` otherwise.
//   Future<bool> isConnected() async {
//     try {
//       List<ConnectivityResult> result = await _connectivity.checkConnectivity();
//       return !result.contains(ConnectivityResult.none);
//     } on PlatformException catch (_) {
//       return false;
//     }
//   }

//   /// Dispose or close the active connectivity stream.
//   @override
//   void onClose() {
//     _connectivitySubscription.cancel();
//     super.onClose();
//   }
// }
