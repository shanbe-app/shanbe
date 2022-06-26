import 'dart:async';
import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/amplifyconfiguration.dart';
import 'package:client/models/ModelProvider.dart';
import 'package:client/rx/services/rx_service.dart';

class AmplifyService extends RxService {
  AmplifyService();

  @override
  Future<void> onCreate() async {
    AmplifyDataStore dataStore =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    AmplifyAuthCognito auth = AmplifyAuthCognito();
    AmplifyAPI api =
        AmplifyAPI(modelProvider: ModelProvider.instance, authProviders: []);
    if (Platform.isAndroid || Platform.isIOS) {
      await Amplify.addPlugin(dataStore);
    }
    await Amplify.addPlugins([auth, api]);
    await Amplify.configure(amplifyconfig);
    if (Platform.isAndroid || Platform.isIOS) {
      await Amplify.DataStore.start();
    }
    // Amplify.Hub.listen([HubChannel.Auth, HubChannel.DataStore], (event) {
    //   print('event ${event.eventName} ${event.payload}');
    // });
  }

  @override
  Future<void> onTerminate() async {
    if (Platform.isAndroid || Platform.isIOS) {
      Amplify.DataStore.stop();
    }
  }
}
