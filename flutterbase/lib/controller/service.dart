class ApiPrestataire {
  List<Map<String, String>> getAllCategories() {
    List<Map<String, String>> dataItem = [
      {"icon": "img/icons8_design 1.svg", "text": "Design"},
      {"icon": "img/icons8_laptop_play_video 1.svg", "text": "Monteur Vidéo"},
      {"icon": "img/icons8_subtitles 1.svg", "text": "Transcipteur"},
      {"icon": "img/icons8_subtitles 1.svg", "text": "Transcipteur"}
    ];
    return dataItem;
  }

  List<Map<String, String>> getAllServices() {
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

    return itemCardRecommande;
  }
}
