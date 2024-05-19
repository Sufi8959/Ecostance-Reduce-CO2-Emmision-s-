import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

// abstract class NetworkInfo {
//   Future<ConnectivityResult> get connectivityResult;
//   Future<bool> get isConnected;
//   Stream<ConnectivityResult> get connectionStream;
//   init();
// }

class NetworkInfoImplementer {
  bool hasConnection = false;

  StreamController connectionChangeController = StreamController.broadcast();

  final Connectivity _connectivity = Connectivity();

  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  void dispose() {
    connectionChangeController.close();
  }

  void _connectionChange(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      connectionChangeController.add(true);
    } else {
      connectionChangeController.add(false);
    }
  }

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('https://google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }
    connectionChangeController.add(hasConnection);
    return hasConnection;
  }
}
