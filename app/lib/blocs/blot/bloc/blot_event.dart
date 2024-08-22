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
  final String? provider, status;
  final int page, perPage;
  const BlotFetchEvent({
    this.page = 1,
    this.perPage = 10,
    
     this.provider,
     this.status,
  });

  BlotFetchEvent copyWith({
    String? provider,
    String? status,
    int? page,
    int? perPage,
  }) {
    return BlotFetchEvent(
     
      provider: provider ?? this.provider,
      status: status ?? this.status,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }

  @override
  List<Object> get props => [provider!, status!, page, perPage];
}
