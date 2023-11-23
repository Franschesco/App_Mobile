import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:white_app/business/locale/app_localizations.dart';

import '../model/chargement_state.dart';
import 'chargement_event.dart';

class ChargementBloc extends Bloc<ChargementEvent, ChargementState> {
  ChargementBloc({ChargementState? parkingState})
      : super(parkingState ?? ChargementState.initial()) {
    on<ChargementEventFetch>(_onChargementEventFetch);
  }

  Future<void> _onChargementEventFetch(
    ChargementEventFetch event,
    Emitter<ChargementState> emit,
  ) async {
    //emit
    await MyAppLocalizations.initLocale();

    debugPrint("Fin de Chargement !");
    emit(state.copyWith(
      newIsloaded: true,
    ));
  }
}
