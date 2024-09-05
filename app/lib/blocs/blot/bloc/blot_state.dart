part of 'blot_bloc.dart';

sealed class BlotState extends Equatable {
  const BlotState();

  @override
  List<Object> get props => [];
}

final class BlotInitial extends BlotState {}

//state for created blot
final class BlotCreated extends BlotState {
  final BlotResponse blotResponse;
  const BlotCreated(this.blotResponse);
}

final class BlotCreating extends BlotState {}

//state for Blot error
final class BlotErrorState extends BlotState {
  final BlotError message;
  const BlotErrorState(this.message);
}

//state for Fetch Blots
class BlotFetched extends BlotState {
  final List<Blot> blots;
  final bool hasReachedMax;

  const BlotFetched({required this.blots, required this.hasReachedMax});

  BlotFetched copyWith({
    List<Blot>? blots,
    bool? hasReachedMax,
  }) {
    return BlotFetched(
      blots: blots ?? this.blots,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [blots, hasReachedMax];
}

final class BlotFetching extends BlotState {}
final class BlotUpdated extends BlotState {
  final BlotResponse blotResponse;
  const BlotUpdated(this.blotResponse);
}

final class BlotFetchedDetail extends BlotState{
  final BlotDetatails data;
  const BlotFetchedDetail(this.data);
}

class BlotOfferAccepted extends BlotState {
  final BlotDetatails blotResponse;
  const BlotOfferAccepted(this.blotResponse);
}

final class BlotDeleted extends BlotState {
  final String message;
  const BlotDeleted(this.message);

  @override
  List<Object> get props => [message];
}
