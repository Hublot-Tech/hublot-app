part of 'service_bloc.dart';

abstract class ServiceState {}

class ServiceInitial extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceLoaded extends ServiceState {
  final List<Service> services;

  ServiceLoaded(this.services);
}

// --  CREATION DU SERVICE        --//
class ServiceCreatingState extends ServiceState {}

class ServiceCreatedState extends ServiceState {
  final SuccessServiceCreation successServiceCreation;
  ServiceCreatedState(this.successServiceCreation);
}

class ServiceCreationErrorState extends ServiceState {
  final ErrorServiceCreation errorServiceCreation;

  ServiceCreationErrorState(this.errorServiceCreation);
}
// -- FIN  CREATION DU SERVICE        --//

// --  FETCHING SERVICE  {ID}      --//
class ServiceFetchingByIdLoading extends ServiceState {}

class ServiceFetchedByIdState extends ServiceState {
  final ServiceDetails service;
  ServiceFetchedByIdState(this.service);
}

class ErrorServiceFetchingByIdState extends ServiceState {
  final ErrorServiceFetching error;
  ErrorServiceFetchingByIdState(this.error);
}

// --  FIN FETCHING SERVICE  {ID}      --//

// -- ALL  FETCHING SERVICE        --//
class ServiceFetchingAllLoading extends ServiceState {}

class ServiceFectchedAllState extends ServiceState {
  final List<Service> services;
  ServiceFectchedAllState(this.services);
}

class ErrorServiceFetchingAllState extends ServiceState {
  final ErrorServiceFetching error;
  ErrorServiceFetchingAllState(this.error);
}
// -- FIN ALL  FETCHING SERVICE        --//

class ServiceError extends ServiceState {
  final String message;

  ServiceError(this.message);
}
///////////////////////////////////////
//////////////////////////////////////
// --  FETCHING SERVICE  {ID}      --//
class ServiceOffersByIdLoading extends ServiceState {}

class ServiceOffersByIdState extends ServiceState {
  final List<OfferDetails> service;
  ServiceOffersByIdState(this.service);
}

class ErrorServiceOffersByIdState extends ServiceState {
  final ErrorServiceFetching error;
  ErrorServiceOffersByIdState(this.error);
}

// --  FIN FETCHING SERVICE  {ID}      --//