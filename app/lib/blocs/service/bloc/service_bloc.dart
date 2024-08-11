import 'dart:async';
import 'dart:io';
import 'package:app/model/offer_model.dart';
import 'package:app/model/offer_response.dart';
import 'package:app/model/service.model.dart';
import 'package:app/model/service_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:app/services/service.dart';
part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc() : super(ServiceInitial()) {
    on<FetchServiceByIdEvent>(_fectchServiceById);
    on<FetchServicesEvent>(_fectchService);
    on<FetchServiceOffersByIdEvent>(_fectchServiceOffersById);
  }

  final ApiService apiService = ApiService();

  FutureOr<void> _fectchServiceById(
      FetchServiceByIdEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceFetchingByIdLoading());
    try {
      final result = await apiService.getServiceById(event.serviceId);
      if (result is SuccessServiceFetchingById) {
        emit(ServiceFetchedByIdState(result.data));
      } else if (result is ErrorServiceFetching) {
        print(result.status);
        emit(ErrorServiceFetchingByIdState(result));
        throw Exception(result.message);
      }
    } catch (e) {
      emit(ErrorServiceFetchingByIdState(
          ErrorServiceFetching(message: e.toString(), status: 500)));
      throw Exception(e);
    }
  }

  Future<void> _fectchService(
      FetchServicesEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceFetchingAllLoading());
    try {
      final result = await apiService.getAllServices();
      if (result is SuccessServiceFetching) {
        emit(ServiceFectchedAllState(result.data));
      } else if (result is ErrorServiceFetching) {
        emit(ErrorServiceFetchingAllState(ErrorServiceFetching(
            message: result.message, status: result.status)));
      }
    } catch (e) {
      emit(ErrorServiceFetchingAllState(
          ErrorServiceFetching(message: e.toString(), status: 500)));
    }
  }

  FutureOr<void> _fectchServiceOffersById(
      FetchServiceOffersByIdEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceOffersByIdLoading());
    try {
      final result = await apiService.getOffersById(event.serviceId);
      if (result is SuccessOfferFeching) {
        emit(ServiceOffersByIdState(result.data));
      } else if (result is ErrorServiceFetching) {
        print(result.status);
        emit(ErrorServiceOffersByIdState(result));
      }
    } catch (e) {
      emit(ErrorServiceFetchingByIdState(
          ErrorServiceFetching(message: e.toString(), status: 500)));
    }
  }
}
