import 'package:app/model/offer_item_model.dart';

class OfferEntity {
  final String name;
  final double price;
  final double estimatedDuration;
  final String serviceId;
  final String? id;
  final List<OfferItemDto>? items;

  OfferEntity({
    required this.name,
    required this.price,
    required this.estimatedDuration,
    required this.serviceId,
    this.id,
    this.items,
  });

  factory OfferEntity.empty() {
    return OfferEntity(
      name: '',
      price: 0,
      estimatedDuration: 0,
      serviceId: '',
      id: null,
      items: [],
    );
  }

  factory OfferEntity.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<OfferItemDto> items =
        itemsList.map((item) => OfferItemDto.fromJson(item)).toList();

    return OfferEntity(
      name: json['name'] as String,
      price: json['price'].toDouble(),
      estimatedDuration: json['estimatedDuration'].toDouble(),
      serviceId: json['service'] as String,
      id: json['id'] as String,
      items: items,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'estimatedDuration': estimatedDuration,
      'service': serviceId,
      'items': items!.map((item) => item.toJson()).toList(),
    };
  }
}

class OfferDetails {
  final String name;
  final int price;
  final int estimatedDuration;
  final String serviceId;
  final String provider;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;

  OfferDetails({
    required this.name,
    required this.price,
    required this.estimatedDuration,
    required this.serviceId,
    required this.provider,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory OfferDetails.fromJson(Map<String, dynamic> json) {
    return OfferDetails(
      name: json['name'],
      price: json['price'],
      estimatedDuration: json['estimatedDuration'],
      serviceId: json['service'],
      provider: json['provider'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      id: json['id'],
    );
  }
  factory OfferDetails.isEmpty() {
    return OfferDetails(
        name: '',
        price: 0,
        estimatedDuration: 0,
        serviceId: "",
        provider: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: '');
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'estimatedDuration': estimatedDuration,
      'service': serviceId,
      'provider': provider,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'id': id,
    };
  }
}
