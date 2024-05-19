import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'internet_event.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InternetState(isPopupOpen: false).init()) {
    Connectivity().onConnectivityChanged.listen((result) async {
      //add(InternetBlocConnectionChanged(isPopUpOpened: false));
      if (Platform.isIOS) {
        add(InternetBlocConnectionChanged());
      } else {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          add(InternetBlocConnectionChanged());
        } else {
          add(InternetBlocConnectionChanged());
        }
      }
    });

    on<InitEvent>(_init);
    on<InternetBlocConnectionChanged>((event, emit) async {
      bool isDeviceConnected = await InternetConnectionChecker().hasConnection;
      return emit(isDeviceConnected
          ? ConnectedState(isPopupOpen: state.isPopupOpen)
          : DisconnectedState(isPopupOpen: state.isPopupOpen));
    });
    on<InternetBlocPopUpStatusChanged>((event, emit) {
      if (state is ConnectedState) {
        emit(ConnectedState(isPopupOpen: event.newStatus));
      } else if (state is DisconnectedState) {
        emit(DisconnectedState(isPopupOpen: event.newStatus));
      }
    });
  }

  void _init(InitEvent event, Emitter<InternetState> emit) async {
    bool isDeviceConnected = await InternetConnectionChecker().hasConnection;
    emit(isDeviceConnected
        ? ConnectedState(isPopupOpen: false)
        : DisconnectedState(isPopupOpen: false));
  }
}
