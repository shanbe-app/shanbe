import 'package:client/models/preferences.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/managers/models_collection.dart';
import 'package:client/rx/services/firebase_service.dart';
import 'package:client/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class PreferencesBloc extends RxBloc {
  final CollectionReference<Preferences> _preferencesRef;
  final FirebaseService _firebaseService;

  PreferencesBloc(this._firebaseService)
      : _preferencesRef = preferencesCollectionReference(_firebaseService);

  Future<void> createPreference(String userId) async {
    Preferences preferences = Preferences(
        id: const Uuid().v4(),
        uid: userId,
        calendar: Constants.DEFAULT_CALENDAR,
        createdAt: Timestamp.now(),
        updatedAt: Timestamp.now(),
        startOfTheWeekType: Constants.DEFAULT_START_OF_THE_WEEK,
        theme: Constants.DEFAULT_THEME,
        locale: Constants.DEFAULT_LOCALE);
    await _preferencesRef.doc(preferences.id).set(preferences);
  }

  Future<List<Preferences>> allPreferences(String uid) async {
    return (await _preferencesRef.where('uid', isEqualTo: uid).get())
        .docs
        .map((e) => e.data())
        .toList();
  }

  Future<void> deletePreferences(List<Preferences> preferences) async {
    await Future.forEach(preferences, (Preferences element) async {
      await _preferencesRef.doc(element.id).delete();
    });
  }
}
