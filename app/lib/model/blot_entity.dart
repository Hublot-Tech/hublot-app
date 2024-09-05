import 'package:app/model/blot_offer.dart';
import 'package:app/model/offer_item_model.dart';
import 'package:app/model/user.model.dart';

class BlotEntity {
  final String? id, payement, provider;
  final String offer, description, status, consumer;
  final int price;
  final DateTime startDate;
  final List<BlotOptionEntity> option;
  final int duration;
  const BlotEntity(
      {this.id,
      this.payement,
      this.provider,
      required this.option,
      required this.price,
      required this.offer,
      required this.description,
      required this.status,
      required this.consumer,
      required this.startDate,
      required this.duration});

  //factory empty BlotEntity
  factory BlotEntity.empty() => BlotEntity(
      price: 0,
      provider: '',
      offer: '',
      option: [],
      description: '',
      status: '',
      consumer: '',
      startDate: DateTime.now(),
      duration: 0);

  //factory BlotEntity from json
  factory BlotEntity.fromJson(Map<String, dynamic> json) => BlotEntity(
      id: json['id'],
      provider: json['provider'],
      option: json['option'] != null
          ? List<BlotOptionEntity>.from(
              json['options'].map((x) => BlotOptionEntity.fromJson(x)))
          : [],
      payement: json['payement'],
      price: json['price'],
      offer: json['offer'],
      description: json['decription'] as String,
      status: json['status'],
      consumer: json['consumer'],
      startDate: DateTime.parse(json['startDate']),
      duration: json['duration']);

  //to json method
  Map<String, dynamic> toJson() => {
        'id': id,
        'payement': payement,
        'provider': provider,
        'price': price,
        'offer': offer,
        'decription': description,
        'options': List<dynamic>.from(option.map((x) => x.toJson())),
        'status': status,
        'consumer': consumer,
        'startDate': startDate.toIso8601String(),
        'duration': duration
      };
}

class BlotOptionEntity {
  final int quanity;
  final String? id;
  final OfferItemDto item;
  const BlotOptionEntity({required this.quanity, this.id, required this.item});

  //factory BlotOptionEntity is empty
  factory BlotOptionEntity.empty() =>
      BlotOptionEntity(quanity: 0, item: OfferItemDto.isEmpty());
  //factory BlotOptionEntity from json
  factory BlotOptionEntity.fromJson(Map<String, dynamic> json) =>
      BlotOptionEntity(
          quanity: json['quanity'], id: json['id'], item: json['item']);

  //factory to json
  Map<String, dynamic> toJson() => {
        'quanity': quanity,
        'id': id,
        'item': item,
      };
}

class Blot {
  final int price;
  final DateTime startDate;
  final int duration;
  final String status;
  final String offer;
  final List<dynamic>
      options; // Adapte le type en fonction du contenu de "options"
  final String consumer;
  final String provider;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String id;

  Blot({
    required this.price,
    required this.startDate,
    required this.duration,
    required this.status,
    required this.offer,
    required this.options,
    required this.consumer,
    required this.provider,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Blot.fromJson(Map<String, dynamic> json) {
    return Blot(
      price: json['price'],
      startDate: DateTime.parse(json['startDate']),
      duration: json['duration'],
      status: json['status'],
      offer: json['offer'],
      options: json['options'],
      consumer: json['consumer'],
      provider: json['provider'],
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'startDate': startDate.toIso8601String(),
      'duration': duration,
      'status': status,
      'offer': offer,
      'options': options,
      'consumer': consumer,
      'provider': provider,
      'updatedAt': updatedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'id': id,
    };
  }
}

class BlotDetatails {
  final int price;
  final DateTime startDate;
  final int duration;
  final String status;
  final String description, payment, payoutRef;
  final BlotOffer offer;
  final List<BlotOptionEntity>
      options; // Adapte le type en fonction du contenu de "options"

  final User provider, consumer;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String id;
  BlotDetatails(
      {required this.consumer,
      required this.description,
      required this.createdAt,
      required this.duration,
      required this.id,
      required this.offer,
      required this.options,
      required this.price,
      required this.provider,
      required this.startDate,
      required this.payment,
      required this.payoutRef,
      required this.status,
      required this.updatedAt});

  //factory BlotDetatails from json
  factory BlotDetatails.fromJson(Map<String, dynamic> json) {
    return BlotDetatails(
      consumer: User.fromJson(json['consumer']),
      createdAt: DateTime.parse(json['createdAt']),
      payment: json['payment'] != null ? json['payment'] : '',
      payoutRef: json['payoutRef'] != null ? json['payoutRef'] : '',
      duration: json['duration'] != null ? json['duration'] : 0,
      id: json['id'] != null ? json['id'] : '',
      offer: json['offer'] != null ? BlotOffer.fromJson(json['offer']) : BlotOffer.empty(),
      options: json['option'] != null
          ? List<BlotOptionEntity>.from(
              json['options'].map((x) => BlotOptionEntity.fromJson(x)))
          : [],
      price: json['price'],
      description:json['description']!=null?json['description']:'',
      provider: User.fromJson(json['provider']),
      startDate: DateTime.parse(json['startDate']),
      status: json['status'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  //factory blot is empty
  factory BlotDetatails.empty() => BlotDetatails(
        payment: '',
        payoutRef: '',
        consumer: User.empty(),
        createdAt: DateTime.now(),
        duration: 0,
        id: '',
        offer: BlotOffer.empty(),
        options: [],
        price: 0,
        provider: User.empty(),
        startDate: DateTime.now(),
        description: '',
        status: '',
        updatedAt: DateTime.now(),
      );

  //factory blot to json
  Map<String, dynamic> toJson() {
    return {
      'consumer': consumer.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'duration': duration,
      'id': id,
      'offer': offer.toJson(),
      'description':description,
      'options': options,
      'price': price,
      'provider': provider.toJson(),
      'startDate': startDate.toIso8601String(),
      'status': status,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
