part of 'kyc_bloc.dart';

sealed class KycEvent extends Equatable {
  const KycEvent();

  @override
  List<Object> get props => [];
}

final class KycStarted extends KycEvent {}

//send List<file> to kyc
final class KycSubmitted extends KycEvent {
  final List<File> files;
  const KycSubmitted({required this.files});
}

final class KycStatus extends KycEvent {
  final String message;
  const KycStatus({required this.message});
}
