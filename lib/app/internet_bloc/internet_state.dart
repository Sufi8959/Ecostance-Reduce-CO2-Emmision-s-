class InternetState {
  InternetState({required this.isPopupOpen});
  InternetState init() {
    return InternetState(isPopupOpen: false);
  }

  // InternetState clone() {
  //   return InternetState(isPopupOpen: false);
  // }
  bool isPopupOpen;
}

class ConnectedState extends InternetState {
  ConnectedState({required super.isPopupOpen});
}

class DisconnectedState extends InternetState {
  DisconnectedState({required super.isPopupOpen});
}
