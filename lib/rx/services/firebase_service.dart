import 'package:client/firebase_options.dart';
import 'package:client/rx/services/rx_service.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService extends RxService {
  late FirebaseApp firebaseApp;

  @override
  Future<void> onCreate() async {
    firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    firebaseApp.setAutomaticResourceManagementEnabled(true);
    firebaseApp.setAutomaticDataCollectionEnabled(true);
  }

  @override
  Future<void> onTerminate() async {
    firebaseApp.delete();
  }

}