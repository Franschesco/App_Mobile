abstract class NavigationEvent {
  const NavigationEvent();
}

class NavigationEventPop extends NavigationEvent {
  const NavigationEventPop();
}

class NavigationEventAdd extends NavigationEvent {
  final String destination;
  final Object? arguments;

  const NavigationEventAdd(this.destination, {this.arguments});
}

class NavigationEventPopUntilOrAdd extends NavigationEvent {
  final String destination;

  const NavigationEventPopUntilOrAdd(
    this.destination,
  );
}

class NavigationEventReplace extends NavigationEvent {
  static const String methodName = "replaceRoute";
  static const String arg = "route";

  final String destination;

  const NavigationEventReplace(this.destination);
}
