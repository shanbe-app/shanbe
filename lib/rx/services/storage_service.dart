
import 'package:client/rx/services/rx_service.dart';

class StorageService<T> extends RxService {
  List<T> all() {
    return [];
  }

  @override
  Future<void> onCreate() async {
  }
  @override
  Future<void> onTerminate() async {
  }
}