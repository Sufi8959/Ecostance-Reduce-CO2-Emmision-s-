abstract class InternetEvent {}

class InitEvent extends InternetEvent {}

class InternetBlocConnectionChanged extends InternetEvent {
  InternetBlocConnectionChanged();
}

class InternetBlocPopUpStatusChanged extends InternetEvent {
  InternetBlocPopUpStatusChanged({required this.newStatus});
  bool newStatus;
}
