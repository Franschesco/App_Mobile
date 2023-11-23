import 'package:bloc/bloc.dart';
import 'package:white_app/business/accueil/bloc/accueil_event.dart';
import 'package:white_app/business/accueil/model/accueil_state.dart';

class AccueilBloc extends Bloc<AccueilEvent, AcccueilState> {
  AccueilBloc({AcccueilState? parkingState})
      : super(parkingState ?? AcccueilState.initial()) {
    on<AccueilEventFetch>(_onChargementEventFetch);
  }

  Future<void> _onChargementEventFetch(
    AccueilEventFetch event,
    Emitter<AcccueilState> emit,
  ) async {
    //emit
    emit(state.copyWith(
      newIsloaded: true,
    ));
  }
}
