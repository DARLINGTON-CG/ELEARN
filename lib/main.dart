import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app/bloc/app_bloc.dart';
import 'features/user/presentation/pages/login.dart';
import 'features/app_content/presentation/homepage.dart';
import 'features/onboarding/pages/onboarding.dart';
import 'features/user/data/repositories/authentication_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  final authenticationRepository = AuthenticationRepository(
    firebaseAuth: FirebaseAuth.instance,
  );
  await authenticationRepository.user.first;
  SharedPreferences.getInstance().then((prefs) {
    bool firstTime = prefs.getBool('firstTime') ?? true;
    bool authenticated = prefs.getBool('authStatus') ?? false;
    runApp(App(
        authenticationRepository: authenticationRepository,
        authStatus: authenticated,
        firstTimeStatus: firstTime));
  });
}

class App extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  final bool firstTimeStatus;
  final bool authStatus;

  const App(
      {Key? key,
      required this.authenticationRepository,
      required this.firstTimeStatus,
      required this.authStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) =>
            AppBloc(authenticationRepository: authenticationRepository),
        child: MaterialApp(
          title: 'ELearn',
          home: Builder(builder: (BuildContext context) {
            double screenHeight = MediaQuery.of(context).size.height;
            if (firstTimeStatus)
              return Onboarding(screenHeight: screenHeight);
            else if (authStatus)
              return HomePage();
            else
              return Login();
          }),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
