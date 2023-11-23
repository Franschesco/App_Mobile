import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/navigation_state.dart';
import 'navigation_event.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initial()) {
    on<NavigationEventAdd>(_onNavigateAdd);
    on<NavigationEventPop>(_onNavigatePop);
    on<NavigationEventPopUntilOrAdd>(_onNavigatePopUntilOrAdd);
    on<NavigationEventReplace>(_onNavigationEventReplace);
  }

  void _onNavigationEventReplace(
    NavigationEventReplace event,
    Emitter<NavigationState> emit,
  ) {
    navigatorKey.currentState?.popAndPushNamed(event.destination);
    emit(state.copyWith(
      routes: List.from(state.route)
        ..removeLast()
        ..add(event.destination),
    ));
  }

  void _onNavigateAdd(NavigationEventAdd event, Emitter<NavigationState> emit) {
    if (state.currentRoute != event.destination) {
      navigatorKey.currentState?.pushNamed(
        event.destination,
        arguments: event.arguments,
      );

      emit(state.copyWith(
        routes: List.from(state.route)..add(event.destination),
      ));
    }
  }

  void _onNavigatePop(NavigationEventPop event, Emitter<NavigationState> emit) {
    if (state.route.length != 1 && navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState?.pop();
    }
    emit(state.copyWith(routes: List.from(state.route)..removeLast()));
  }

  void _onNavigatePopUntilOrAdd(
    NavigationEventPopUntilOrAdd event,
    Emitter<NavigationState> emit,
  ) {
    if (state.route.contains(event.destination)) {
      if (navigatorKey.currentState?.canPop() ?? false) {
        navigatorKey.currentState?.popUntil((route) {
          return route.settings.name == event.destination;
        });
      }

      // On récupère les routes que l'on garde
      List<String> newRoutes = [];
      for (String route in state.route) {
        newRoutes.add(route);
        if (route == event.destination) {
          break;
        }
      }
      emit(state.copyWith(
        routes: newRoutes,
      ));
    } else {
      add(NavigationEventAdd(event.destination));
    }
  }
}
