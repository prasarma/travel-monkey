import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAGnATJxODcIbha8jYB-cAj06fxjkces2g",
            authDomain: "ai-trip-planner-acf1f.firebaseapp.com",
            projectId: "ai-trip-planner-acf1f",
            storageBucket: "ai-trip-planner-acf1f.appspot.com",
            messagingSenderId: "460045627504",
            appId: "1:460045627504:web:a5a77f99c67008a71a84b5"));
  } else {
    await Firebase.initializeApp();
  }
}
