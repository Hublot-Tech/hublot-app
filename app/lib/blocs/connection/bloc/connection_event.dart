part of 'connection_bloc.dart';
abstract class ConnectionEvent extends Equatable {
  const ConnectionEvent();

  @override
  List<Object> get props => [];
}

class ConnectionChangedEvent extends ConnectionEvent {
  final ConnectivityResult connectivityResult;

  const ConnectionChangedEvent(this.connectivityResult);

  @override
  List<Object> get props => [connectivityResult];
}