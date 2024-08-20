part of 'blot_bloc.dart';

sealed class BlotEvent extends Equatable {
  const BlotEvent();

  @override
  List<Object> get props => [];
}

// Evenement pour la création d'un blot
class BlotCreatedEvent extends BlotEvent {
  final BlotEntity blotEntity;
  const BlotCreatedEvent({required this.blotEntity});
}

// Evenement pour fetch des blots avec scrolling infini
class BlotFetchEvent extends BlotEvent {
  final String consumer, provider, status;
  final int page, perPage;
  const BlotFetchEvent({
    this.page = 1,
    this.perPage = 10,
    required this.consumer,
    required this.provider,
    required this.status,
  });

  BlotFetchEvent copyWith({
    String? consumer,
    String? provider,
    String? status,
    int? page,
    int? perPage,
  }) {
    return BlotFetchEvent(
      consumer: consumer ?? this.consumer,
      provider: provider ?? this.provider,
      status: status ?? this.status,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }

  @override
  List<Object> get props => [consumer, provider, status, page, perPage];
}
