import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:white_app/business/accueil/bloc/accueil_bloc.dart';
import 'package:white_app/business/chargement/bloc/chargement_bloc.dart';
import 'package:white_app/business/navigation/bloc/navigation_bloc.dart';
import 'package:white_app/business/navigation/model/navigation_state.dart';
import 'package:white_app/business/navigation/model/routes.dart';
import 'package:white_app/business/navigation/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (BuildContext context) => NavigationBloc(),
        ),
        BlocProvider<ChargementBloc>(
          create: (BuildContext context) => ChargementBloc(),
        ),
        BlocProvider<AccueilBloc>(
          create: (BuildContext context) => AccueilBloc(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          // Sert à enlever le focus quand on clique en dehors d'un champ de texte
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyApp',
          //Localizations languages
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // Router
          initialRoute: Routes.chargement,
          navigatorKey: navigatorKey,
          onGenerateRoute: (RouteSettings settings) =>
              AppRouter.route(settings),
        ),
      ),
    );
  }
}
