import 'package:client/rx/services/rx_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityService extends RxService {
  bool _connectedToInternet = false;

  bool get connectedToInternet => _connectedToInternet;

  @override
  Future<void> onCreate() async {
    _connectedToInternet = await InternetConnectionChecker().hasConnection;
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        _connectedToInternet = await InternetConnectionChecker().hasConnection;
      }
    });
  }

  @override
  Future<void> onTerminate() async {}
}
