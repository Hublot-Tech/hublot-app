part of 'connection_bloc.dart';

@immutable
sealed class ConnectionsState {}

final class ConnectionInitial extends ConnectionsState {}

class ConnectionSuccess extends ConnectionsState {}

class ConnectionFailure extends ConnectionsState {}
