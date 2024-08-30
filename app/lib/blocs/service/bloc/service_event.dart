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

class FetchServicesEvent extends ServiceEvent {
   final int? perPage;
  final  int? page;
  final  double? longitude;
  final  double? latitude;
  final  String? placeName;
  final  int? maxDistance;
  final  String? createdBy;
  final  String? provider;
 final   String? category;
  final  String? keywords;
    const FetchServicesEvent({this.perPage=10,this.page=1,this.longitude,this.latitude,this.placeName,
    this.createdBy,this.provider,this.category,this.keywords,this.maxDistance});
}

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


class FetchProviderServicesEvent extends ServiceEvent {
   final int? perPage;
  final  int? page;
  final  double? longitude;
  final  double? latitude;
  final  String? placeName;
  final  int? maxDistance;
  final  String? createdBy;
  final  String? provider;
 final   String? category;
  final  String? keywords;
    const FetchProviderServicesEvent({this.perPage=10,this.page=1,this.longitude,this.latitude,this.placeName,
    this.createdBy,this.provider,this.category,this.keywords,this.maxDistance});
}
