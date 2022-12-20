import 'package:client/firebase_options.dart';
import 'package:client/rx/services/rx_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService extends RxService {
  late FirebaseApp firebaseApp;
  late FirebaseFirestore firestore;

  @override
  Future<void> onCreate() async {
    firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    firebaseApp.setAutomaticDataCollectionEnabled(true);
    firestore = FirebaseFirestore.instance;
    firestore.useFirestoreEmulator('localhost', 4000);
  }

  @override
  Future<void> onTerminate() async {
    await firebaseApp.delete();
  }
}
