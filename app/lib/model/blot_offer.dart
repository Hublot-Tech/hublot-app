class BlotOffer {
  final String name;
  final int price;
  final int estimatedDuration;
  final String id;
  final String service;

  BlotOffer({
    required this.name,
    required this.price,
    required this.estimatedDuration,
    required this.id,
    required this.service,
  });

  // Méthode pour créer une instance de BlotOffer à partir d'un Map JSON
  factory BlotOffer.fromJson(Map<String, dynamic> json) {
    return BlotOffer(
      name: json['name'] as String,
      price: json['price'] as int,
      estimatedDuration: json['estimatedDuration'] as int,
      id: json['id'] as String,
      service: json['service'] as String,
    );
  }

  // Méthode pour convertir l'instance de BlotOffer en Map JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'estimatedDuration': estimatedDuration,
      'id': id,
      'service': service,
    };
  }

  // Méthode pour créer une copie de BlotOffer avec des modifications optionnelles
  BlotOffer copyWith({
    String? name,
    int? price,
    int? estimatedDuration,
    String? id,
    String? service,
  }) {
    return BlotOffer(
      name: name ?? this.name,
      price: price ?? this.price,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      id: id ?? this.id,
      service: service ?? this.service,
    );
  }

  // Méthode pour créer une instance vide de BlotOffer
  factory BlotOffer.empty() {
    return BlotOffer(
      name: '',
      price: 0,
      estimatedDuration: 0,
      id: '',
      service: '',
    );
  }

  @override
  String toString() {
    return 'BlotOffer(name: $name, price: $price, estimatedDuration: $estimatedDuration, id: $id, service: $service)';
  }
}