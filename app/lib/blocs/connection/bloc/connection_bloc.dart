import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionsState> {
  final Connectivity _connectivity;

  ConnectionBloc(this._connectivity) : super(ConnectionInitial()) {
    on<ConnectionChangedEvent>(_onConnectionChanged);
    _startListening();
  }

  void _startListening() {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      for (var resut in result) {
        add(ConnectionChangedEvent(
            resut)); // Ajoute l'événement pour chaque résultat
      }
    });
  }

  Future<void> _onConnectionChanged(
      ConnectionChangedEvent event, Emitter<ConnectionsState> emit) async {
    if (event.connectivityResult == ConnectivityResult.none) {
      emit(ConnectionFailure());
    } else {
      emit(ConnectionSuccess());
    }
  }
}
