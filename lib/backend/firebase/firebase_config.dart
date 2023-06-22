import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDMhMQFQN0ST7829bh4Y8geWKpezKcGVhY",
            authDomain: "ffproducts-94633.firebaseapp.com",
            projectId: "ffproducts-94633",
            storageBucket: "ffproducts-94633.appspot.com",
            messagingSenderId: "459481255086",
            appId: "1:459481255086:web:e7bb83b62ee3a192ccb13f",
            measurementId: "G-KH2Y36VWHL"));
  } else {
    await Firebase.initializeApp();
  }
}
