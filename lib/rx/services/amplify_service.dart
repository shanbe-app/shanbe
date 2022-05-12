import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/amplifyconfiguration.dart';
import 'package:client/models/ModelProvider.dart';
import 'package:client/rx/services/rx_service.dart';

class AmplifyService extends RxService {
  final AmplifyDataStore dataStore =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAuthCognito authPool = AmplifyAuthCognito();
  final AmplifyAPI amplifyAPI =
      AmplifyAPI(modelProvider: ModelProvider.instance, authProviders: []);

  AmplifyService();

  @override
  Future<void> onCreate() async {
    await dataStore.start();
    await Amplify.addPlugins([dataStore, authPool, amplifyAPI]);
    await Amplify.configure(amplifyconfig);
    // Amplify.DataStore.observe(Project.classType).listen((event) {});
  }

  @override
  Future<void> onTerminate() async {
    dataStore.stop();
  }
}
