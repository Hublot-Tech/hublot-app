class OfferItemDto {
  final String name;
  final String value;
  final String? id;

  OfferItemDto({
    required this.name,
    required this.value,
    this.id,
  });

  factory OfferItemDto.fromJson(Map<String, dynamic> json) {
    return OfferItemDto(
      name: json['name'] as String,
      value: json['value'] as String,
      id: json['id'] as String,
    );
  }

  factory OfferItemDto.isEmpty() {
    return OfferItemDto(
      name: '',
      value: '',
      id: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
      'id': id,
    };
  }
}
