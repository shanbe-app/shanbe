import 'package:client/rx/services/rx_service.dart';
import 'package:workmanager/workmanager.dart';

void _callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {

    return Future.value(true);
  });
}
class BackgroundService extends RxService {
  
  @override
  Future<void> onCreate() async {
    // await Workmanager().initialize(
    //     _callbackDispatcher,
    //     isInDebugMode: true
    //
    // );
    // Workmanager().registerOneOffTask("task-identifier", "simpleTask");
    // Workmanager().registerPeriodicTask("shanbe-notifications", "shanbe-notifications");

  }
  @override
  Future<void> onTerminate() async {}
}