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
    AmplifyAuthCognito auth = AmplifyAuthCognito();
    AmplifyAPI api = AmplifyAPI(modelProvider: ModelProvider.instance);
    await Amplify.addPlugins([auth, api]);
    if (Platform.isAndroid || Platform.isIOS) {
      AmplifyDataStore dataStore =
          AmplifyDataStore(modelProvider: ModelProvider.instance);
      await Amplify.addPlugin(dataStore);
    }
    await Amplify.configure(amplifyconfig);
    print('done setup');
    try {
      List<Space> spaces = await Amplify.DataStore.query(Space.classType);
      print('spaces: ${spaces.length}');
    } catch (e, stack) {
      print(e);
      print(stack);
    }
  }

  @override
  Future<void> onTerminate() async {
    if (Platform.isAndroid || Platform.isIOS) {
      Amplify.DataStore.stop();
    }
  }
}
