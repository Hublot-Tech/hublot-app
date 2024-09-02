part of 'kyc_bloc.dart';

sealed class KycState extends Equatable {
  const KycState();

  @override
  List<Object> get props => [];
}

final class KycInitial extends KycState {}

final class KycLoading extends KycState {}

final class KycSendSuccess extends KycState {}

final class KycFailure extends KycState {
  final KycError error;
  const KycFailure(this.error);
}

final class KycVerified extends KycState {}

//state for kyc status valided or rejected
final class KycStatusState extends KycState {}

