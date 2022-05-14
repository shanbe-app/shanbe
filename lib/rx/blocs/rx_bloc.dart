import 'package:rxdart/rxdart.dart';

abstract class RxBloc {
  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  CompositeSubscription get compositeSubscription => _compositeSubscription;

  void dispose();
}