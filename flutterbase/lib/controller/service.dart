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

  List<String> getAllFilterSearch() {
    List<String> itemSearch = [
      'En ligne',
      'proche de moi',
      'Plus évalué',
      'Moins évalué',
    ];

    return itemSearch;
  }

  List<Map<String, String>> getSplashData() {
    List<Map<String, String>> spashData = [
      {
        "img": "img/presentation11.jpg",
        "text": "Vous êtes passionné(e) et souhaitez vivre de cette passion ?",
        "mig":
            "Plomberie, Electricité, Vitrerie, Chaudronnerie, Seignerie; etc ... ils ont la solution à tous vous besoins "
      },
      {
        "img": "img/presentation22.jpg",
        "text":
            "Tous les micro-services dont vous avez besoin à portée de main !",
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

    return spashData;
  }

  List<Map<String, String>> getAllServices() {
    List<Map<String, String>> itemCardRecommande = [
      {
        "img": "img/image 1.png",
        "name": "Gishlain Kamga",
        "profession": "Photographe",
        "note": "4.6",
        "lieu": "Douala,akwa",
        "Distance": "3Km",
      },
      {
        "img": "img/portrait-stylish-professional-photographer.jpg",
        "name": "Grec Koum",
        "profession": "Photographe",
        "note": "4.6",
        "lieu": "Douala,akwa",
        "Distance": "8Km",
      },
      {
        "img": "img/IMG_3531.JPG",
        "name": "Pessidjo Germann",
        "profession": "Dev Fullstack",
        "note": "4.6",
        "lieu": "Douala,pk21",
        "Distance": "8Km",
      },
    ];

    return itemCardRecommande;
  }
}
