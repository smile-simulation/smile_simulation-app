import 'package:firebase_core/firebase_core.dart';

const firebaseAIOptions = FirebaseOptions(
  apiKey: "AIzaSyBXi-bnFv9avCmDnOWCt5yDyNUGrk0zryLU",
  appId: "1:458288767239:android:9ec61000f9c8fc0df4e5a2",
  messagingSenderId: "458288767239",
  projectId: "final-project-9d757",
  storageBucket: "final-project-9d757.firebasestorage.app",
);
Future<FirebaseApp> getAIApp() async {
  final apps = Firebase.apps;
  final exists = apps.any((app) => app.name == 'AIApp');
  return exists
      ? Firebase.app('AIApp')
      : await Firebase.initializeApp(name: 'AIApp', options: firebaseAIOptions);
}
