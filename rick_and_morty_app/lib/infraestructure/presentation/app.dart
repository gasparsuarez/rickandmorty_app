import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:rick_and_morty_app/application/blocs/residents_bloc/residents_bloc.dart';
import 'package:rick_and_morty_app/config/router/router.dart';
import 'package:rick_and_morty_app/config/theme/app_theme.dart';

import '../../application/blocs/blocs.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => Injector.appInstance.get<CharacterBloc>()),
        BlocProvider(create: (_) => Injector.appInstance.get<ResidentsBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        title: 'Rick and Morty APP',
        routerConfig: RouterApp.router,
      ),
    );
  }
}
