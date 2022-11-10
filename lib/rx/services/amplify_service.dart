import 'dart:async';
import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/amplifyconfiguration.dart';
import 'package:client/models/ModelProvider.dart';
import 'package:client/rx/services/rx_service.dart';
import 'package:client/utils/constants.dart';

class AmplifyService extends RxService {
  late Stream<List<Preferences>> preferences;

  AmplifyService();

  bool get _isAmplifyDatastoreSupported => Platform.isAndroid || Platform.isIOS;

  @override
  Future<void> onCreate() async {
    AmplifyAuthCognito auth = AmplifyAuthCognito();
    AmplifyAPI api = AmplifyAPI(modelProvider: ModelProvider.instance);
    await Amplify.addPlugins([auth, api]);
    if (_isAmplifyDatastoreSupported) {
      AmplifyDataStore dataStore =
          AmplifyDataStore(modelProvider: ModelProvider.instance);
      await Amplify.addPlugin(dataStore);
    }
    await Amplify.configure(amplifyconfig);
    if (_isAmplifyDatastoreSupported) {
      await _listenPreferences();
    }
  }

  Future<void> _listenPreferences() async {
    List<Preferences> prefs =
        await Amplify.DataStore.query(Preferences.classType);
    if (prefs.isEmpty) {
      Amplify.DataStore.save(Preferences(
          theme: Constants.DEFAULT_THEME,
          calendar: Constants.DEFAULT_CALENDAR,
          visibleStaticTaskLists: Constants.DEFAULT_STATIC_TASK_LISTS,
          startOfTheWeek: Constants.DEFAULT_START_OF_THE_WEEK,
          updatedAt: TemporalDateTime(DateTime.now().toUtc())));
    }
    preferences.listen((event) {
      if (event.isNotEmpty && event.length > 1) {
        Preferences latest;
      }
    });
  }

  @override
  Future<void> onTerminate() async {
    if (Platform.isAndroid || Platform.isIOS) {
      Amplify.DataStore.stop();
    }
  }
}
