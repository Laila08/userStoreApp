import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:userecommerce/appRouter.dart';
import 'package:userecommerce/authProvider.dart';
import 'package:userecommerce/fireStoreProvider.dart';
import 'package:userecommerce/firebase_options.dart';
import 'package:userecommerce/splachScreen.dart';
import 'package:userecommerce/userScren/mainPageScreen.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MultiProvider(providers:[
    ChangeNotifierProvider<AuthProvider>(
    create: (context){return AuthProvider();}),
    ChangeNotifierProvider<FireStoreProvider>(
    create: (context){return FireStoreProvider();})
      ],
      child: MaterialApp(
        navigatorKey: AppRouter.navKey,
        debugShowCheckedModeBanner: false,
        home: SplachScreen(),
      ),
    );
  }
}
