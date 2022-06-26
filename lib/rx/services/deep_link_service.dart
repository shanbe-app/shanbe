import 'dart:async';

import 'package:client/rx/services/rx_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_links/uni_links.dart';

/*TODO: setup*/
class DeepLinkService extends RxService {

  final BehaviorSubject<String?> _deepLink = BehaviorSubject();
  late StreamSubscription _subscription;

  Stream<String?> get deepLink => _deepLink.stream;

  @override
  Future<void> onCreate() async {
    _deepLink.add(await getInitialLink());
    _subscription = linkStream.listen((event) {
      _deepLink.add(event);
    });
  }

  @override
  Future<void> onTerminate() async {
    _subscription.cancel();
  }
}