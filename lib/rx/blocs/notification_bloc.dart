import 'package:client/rx/blocs/rx_bloc.dart';

class NotificationBloc extends RxBloc {

  @override
  void dispose() {
    compositeSubscription.dispose();
  }
}
