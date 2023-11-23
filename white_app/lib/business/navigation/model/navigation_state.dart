import 'package:flutter/cupertino.dart';

import 'routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationState {
  final List<String> route;

  const NavigationState({required this.route});

  factory NavigationState.initial() =>
      const NavigationState(route: [Routes.chargement]);

  copyWith({List<String>? routes}) {
    return NavigationState(route: routes ?? route);
  }

  String get currentRoute {
    return route.isNotEmpty ? route.last : Routes.chargement;
  }

  String? get lastRoute {
    return route.length > 1 ? route[route.length - 2] : null;
  }
}
