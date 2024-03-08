import 'package:flutter/material.dart';

const kCategoriecolor = Color.fromRGBO(30, 136, 229, 1);
const kyellowColor = Color.fromRGBO(255, 192, 0, 1);
const kprimaryColor = Color.fromRGBO(10, 17, 40, 1);
const ksecondaryColor = Color.fromRGBO(100, 100, 100, 1);
Text textPresentation(
    {required String mesg,
    double size = 30,
    Color color = kprimaryColor,
    required FontWeight fontWeight}) {
  return Text(
    mesg,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontSize: size,
    ),
  );
}

List<Map<String, String>> dataItem = [
  {"icon": "img/icons8_design 1.svg", "text": "Design"},
  {"icon": "img/icons8_laptop_play_video 1.svg", "text": "Monteur Vidéo"},
  {"icon": "img/icons8_subtitles 1.svg", "text": "Transcipteur"},
  {"icon": "img/icons8_subtitles 1.svg", "text": "Transcipteur"}
];

List<Map<String, String>> spash_data = [
  {
    "img": "img/presentation11.jpg",
    "text": "Vous êtes passionné(e) et souhaitez vivre de cette passion ?",
    "mig":
        "Plomberie, Electricité, Vitrerie, Chaudronnerie, Seignerie; etc ... ils ont la solution à tous vous besoins "
  },
  {
    "img": "img/presentation22.jpg",
    "text": "Tous les micro-services dont vous avez besoin à portée de main !",
    "mig":
        "Plomberie, Electricité, Vitrerie, Chaudronnerie, Seignerie; etc ... tout les metiers sont permis."
  },
  {
    "img": "img/presentation33.jpg",
    "text": "Des échanges constructifs avec des Travailleurs compétents.",
    "mig":
        "Plomberie, Electricité, Vitrerie, Chaudronnerie, Seignerie; etc ... ils ont la solution à tous vous besoins "
  },
];

List<Map<String, String>> itemCardRecommande = [
  {
    "img": "img/image 1.png",
    "name": "Gishlain Kamga ",
    "profession": "Photographe",
    "note": "4.6",
    "lieu": "Douala,akwa",
    "Distance": "3Km",
  },
  {
    "img": "img/portrait-stylish-professional-photographer.jpg",
    "name": "Grec Koum ",
    "profession": "Photographe",
    "note": "4.6",
    "lieu": "Douala,akwa",
    "Distance": "8Km",
  },
  {
    "img": "img/IMG_3531.JPG",
    "name": "Pessidjo Germann ",
    "profession": "Dev Fullstack",
    "note": "4.6",
    "lieu": "Douala,pk21",
    "Distance": "8Km",
  },
];

class EspaceMenuWidget extends StatelessWidget {
  const EspaceMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20);
  }
}
