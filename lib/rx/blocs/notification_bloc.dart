import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

class NotificationBloc extends RxBloc {
  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  @override
  void dispose() {
    _compositeSubscription.dispose();
  }
}
