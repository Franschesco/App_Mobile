import 'navigation_state.dart';

abstract class Routes {
  static const chargement = "chargement";
  static const accueil = "accueil";
  static const onglet2 = "onglet2";
  static const onglet3 = "onglet3";
  static const onglet4 = "onglet4";
  static const onglet5 = "onglet5";
}

abstract class MainPageRoutes {
  static const list = [
    Routes.accueil,
    Routes.onglet2,
    Routes.onglet3,
    Routes.onglet4,
    Routes.onglet5,
  ];

  static int getIndexOfCurrentRoute(NavigationState state) {
    int res = list.indexOf(state.currentRoute);
    // Si la route actuelle n'est pas dans la liste des mainsPageRoutes,
    // On cherche la dernière route qui faisait partit des mainsPageRoutes
    if (res == -1) {
      res = 0;
      for (String route in state.route.reversed) {
        if (list.contains(route)) {
          res = list.indexOf(route);
          break;
        }
      }
    }

    return res;
  }
}
