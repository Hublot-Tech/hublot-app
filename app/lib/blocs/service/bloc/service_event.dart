part of 'service_bloc.dart';

sealed class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

class FetchServiceByIdEvent extends ServiceEvent {
  final String serviceId;
  const FetchServiceByIdEvent(this.serviceId);
}

class FetchServicesEvent extends ServiceEvent {}

class CreateServiceEvent extends ServiceEvent {
  final Service service;
  final File file;
  const CreateServiceEvent(this.service, this.file);
}

class FetchServiceOffersByIdEvent extends ServiceEvent {
  final String serviceId;
  const FetchServiceOffersByIdEvent(this.serviceId);
}

class FetchServiceAndOffer extends ServiceEvent {
  final String serviceId;
  const FetchServiceAndOffer(this.serviceId);
}
