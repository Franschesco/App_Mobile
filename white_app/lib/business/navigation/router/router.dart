import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_app/business/navigation/bloc/navigation_bloc.dart';
import 'package:white_app/business/navigation/bloc/navigation_event.dart';
import 'package:white_app/business/navigation/model/navigation_state.dart';
import 'package:white_app/business/navigation/model/routes.dart';
import 'package:white_app/ui/accueil/accueil_page.dart';
import 'package:white_app/ui/chargement/chargement_page.dart';

class AppRouter {
  // ignore: long-method
  static MaterialPageRoute route(RouteSettings settings) {
    switch (settings.name) {
      case Routes.accueil:
        return MainRoute(
          const AccueilPage(),
          settings: settings,
        );

      case Routes.chargement:
        return MainRoute(
          const ChargementPage(),
          settings: settings,
        );

      default:
        return MainRoute(
          const AccueilPage(),
          settings: settings,
        );
    }
  }
}

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {super.settings})
      : super(
          builder: (context) => WillPopScope(
            //Permet de gérer le bouton retour natif
            onWillPop: () async {
              BlocProvider.of<NavigationBloc>(context)
                  .add(const NavigationEventPop());

              return BlocProvider.of<NavigationBloc>(context)
                          .state
                          .route
                          .length ==
                      1
                  ? true
                  : false;
            },
            child: widget,
          ),
          maintainState: false,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    NavigationState state = BlocProvider.of<NavigationBloc>(context).state;

    return child;

    // plus de transitions :sniff:

    // Si on est sur la page principale et qu'on y reste => changement de tab
    // Alors on a pas besoin de transition, elle se fera dans
    // le widget de la page directement
    return MainPageRoutes.list.contains(state.currentRoute) &&
            MainPageRoutes.list.contains(state.lastRoute ?? Routes.accueil)
        ? child
        : FadeTransition(opacity: animation, child: child);
  }
}

class NoAnimationRoute<T> extends MaterialPageRoute<T> {
  NoAnimationRoute(Widget widget, {super.settings})
      : super(
          builder: (context) => WillPopScope(
            //Permet de gérer le bouton retour natif
            onWillPop: () async {
              BlocProvider.of<NavigationBloc>(context)
                  .add(const NavigationEventPop());

              return BlocProvider.of<NavigationBloc>(context)
                          .state
                          .route
                          .length ==
                      1
                  ? true
                  : false;
            },
            child: widget,
          ),
          maintainState: false,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
        opacity: const AlwaysStoppedAnimation(1.0), child: child);
  }
}
