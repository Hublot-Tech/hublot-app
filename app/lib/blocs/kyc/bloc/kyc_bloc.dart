import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:app/model/kyc_response.dart';
import 'package:app/services/kyc_service.dart';

part 'kyc_event.dart';
part 'kyc_state.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  KycBloc() : super(KycInitial()) {
    on<KycSubmitted>(onSendKycData);
  }
}

final api = KycService();

//method to send kyc data to the server with emit
FutureOr<void> onSendKycData(KycSubmitted event, Emitter<KycState> emit) async {
  emit(KycLoading());
  try {
    final response = await api.submitKyc(event);
    debugPrint(response.toString());
    if (response is KycResponse) {
      emit(KycSendSuccess());
    } else if (response is KycError) {
      emit(KycFailure(response));
    }
  } catch (e) {
    emit(KycFailure(KycError(message: e.toString(), status: 500)));
  }
}
