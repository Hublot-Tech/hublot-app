import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:app/model/blot_entity.dart';
import 'package:app/model/blot_response.dart';
import 'package:app/services/blotService.dart';

part 'blot_event.dart';
part 'blot_state.dart';

class BlotBloc extends Bloc<BlotEvent, BlotState> {
  BlotBloc() : super(BlotInitial()) {
    on<BlotCreatedEvent>(createBlot);
    on<BlotFetchEvent>(getBlot);
    on<BlotFetchIdEvent>(getBlotById);
  }

  final Blotservice blotservice = Blotservice();
  FutureOr<void> createBlot(
      BlotCreatedEvent event, Emitter<BlotState> emit) async {
    emit(BlotCreating());
    try {
      final response = await blotservice.createBloc(event);
      if (response is BlotResponse) {
        emit(BlotCreated(response));
      } else if (response is BlotError) {
        emit(BlotErrorState(response));
      }
    } catch (e) {
      emit(BlotErrorState(BlotError(message: e.toString(), status: 505)));
    }
  }

// FutureOr<void> getBlot(BlotFetchEvent event, Emitter<BlotState> emit) async {
//   emit(BlotFetching());
//   try {
//     final response = await blotservice.getBlots(event: event);
//     if (response is BlotResponseFetch) {
//       emit(BlotFetched(response.data));
//     } else if (response is BlotError) {
//       emit(BlotErrorState(response));
//     }
//   } catch (e) {
//     emit(BlotErrorState(BlotError(message: e.toString(), status: 505)));
//   }
// }
  FutureOr<void> updateStatus(
      BlotUpdateEvent event, Emitter<BlotState> emit) async {
    emit(BlotInitial());
    final response = await blotservice.updateStatusBlot(event);
    if (response is BlotResponse) {
      emit(BlotUpdated(response));
    } else if (response is BlotError) {
      emit(BlotErrorState(response));
    }
  }

  FutureOr<void> getBlot(BlotFetchEvent event, Emitter<BlotState> emit) async {
    final currentState = state;
    if (currentState is BlotFetching) return;

    try {
      List<Blot> oldBlots = [];
      if (currentState is BlotFetched) {
        oldBlots = currentState.blots;
      }

      final response = await blotservice.getBlots(event: event);
      if (response is BlotResponseFetch) {
        final newBlots = response.data;
        final allBlots = oldBlots + newBlots;
        final hasReachedMax = newBlots.isEmpty;

        emit(BlotFetched(blots: allBlots, hasReachedMax: hasReachedMax));
      } else if (response is BlotError) {
        emit(BlotErrorState(response));
      }
    } catch (e) {
      emit(BlotErrorState(BlotError(message: e.toString(), status: 505)));
    }
  }

  FutureOr<void> getBlotById(
      BlotFetchIdEvent event, Emitter<BlotState> emit) async {
    emit(BlotInitial());
    try {
      final response = await blotservice.getBlot(event);
      if (response is BlotResponseDetails) {
        emit(BlotFetchedDetail(response.data));
      } else if (response is BlotError) {
        emit(BlotErrorState(response));
      }
    } catch (e) {
      emit(BlotErrorState(BlotError(message: e.toString(), status: 505)));
    }
  }
}
