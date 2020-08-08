// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:beautiful_app/blocs/auth_blocs/authentication_bloc.dart';
import 'package:beautiful_app/models/NavItems.dart';
import 'package:beautiful_app/models/User.dart';
import 'package:beautiful_app/screens/auth/SplashScreen.dart';
import 'package:beautiful_app/screens/auth/login/LoginScreen.dart';
import 'package:beautiful_app/screens/home/HomePage.dart';
import 'package:beautiful_app/services/auth.dart';
import 'package:beautiful_app/services/user_repo.dart';
import 'package:beautiful_app/shared/simple_bloc_observer.dart';
import 'package:beautiful_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
        ..add(AuthenticationStarted()),
      child: MyApp(userRepository: userRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavItems>(
          create: (context) => NavItems(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe App',
        theme: appTheme(),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationInitial) {
              return SplashScreen();
            }
            if (state is AuthenticationSuccess) {
              return HomePage(name: state.displayName);
            }
            if (state is AuthenticationFailure) {
              return LoginScreen(userRepository: _userRepository);
            }
          },
        ),
      ),
    );
  }
}
