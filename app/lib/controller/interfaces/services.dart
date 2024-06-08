import 'package:app/controller/interfaces/prestataire.dart';

class Services {
  final String img;
  final String name;
  final String profession;
  final String note;
  final String lieu;
  final String distance;
  bool like;
  bool favorite;
  final Prestataire prestataire;

  Services({
    required this.img,
    required this.name,
    required this.profession,
    required this.note,
    required this.lieu,
    required this.distance,
    required this.like,
    required this.favorite,
    required this.prestataire,
  });

  // // Factory constructor to create a Services instance from a map
  // factory Services.fromMap(Map<String, dynamic> map) {
  //   return Services(
  //     img: map['img'] as String? ?? '',
  //     name: map['name'] as String? ?? '',
  //     profession: map['profession'] as String? ?? '',
  //     note: map['note'] as String? ?? '',
  //     lieu: map['lieu'] as String? ?? '',
  //     distance: map['Distance'] as String? ?? '',
  //     prestataire: Prestataire(
  //       name:
  //           (map['prestataire'] as Map<String, dynamic>?)?['name'] as String? ??
  //               '',
  //       firstname: (map['prestataire'] as Map<String, dynamic>?)?['firstname']
  //               as String? ??
  //           '',
  //     ),
  //   );
  // }
}
