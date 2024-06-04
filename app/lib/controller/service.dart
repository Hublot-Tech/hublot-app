class HublotProviderApiApi {
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
    List<String> searchItem = [
      'En ligne',
      'proche de moi',
      'Plus évalué',
      'Moins évalué',
    ];

    return searchItem;
  }

  List<String> getAllCity() {
    List<String> searchItem = [
      'Douala',
      'Yaoundé',
      'Kribi',
      'Édéa',
      'Garoua',
      'Bamenda',
      'Bafoussam',
      'Maroua',
      'Limbé'
    ];

    return searchItem;
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

  List<Map<String, String>> getListLanguage() {
    List<Map<String, String>> listLangue = [
      {"img": "img/french.png", "name": "Francais"},
      {"img": "img/english.png", "name": "Anglais"}
    ];

    return listLangue;
  }

  List<Map<String, String>> getBasicOffer() {
    List<Map<String, String>> listOffer = [
      {"name": "Nombres de photos", "nbre": "10"},
      {"name": "fff", "nbre": "34"}
    ];
    return listOffer;
  }

  List<Map<String, String>> getStandarOffer() {
    List<Map<String, String>> listOffer = [
      {"name": "Nombres de photos", "nbre": "30"},
      {"name": "Qualités des photos", "nbre": "1080 px"}
    ];
    return listOffer;
  }

  List<Map<String, String>> getAllServices() {
    List<Map<String, String>> dataProvider = [
      {
        "img":
            "https://www.cidj.com/sites/default/files/2019-08/photographe.jpg",
        "name": "Gishlain Kamga",
        "profession": "Photographe",
        "note": "4.6",
        "lieu": "Douala,akwa",
        "Distance": "3Km",
      },
      {
        "img":
            "https://www.travailler-a-domicile.fr/wp-content/uploads/2016/06/photographe-mode-inde.jpg",
        "name": "Grec Koum",
        "profession": "Photographe",
        "note": "4.6",
        "lieu": "Douala,akwa",
        "Distance": "8Km",
      },
      {
        "img":
            "https://static.iquesta.com/images/iquesta/article/software-developer-6521720_1280.png",
        "name": "Pessidjo Germann",
        "profession": "Dev Fullstack",
        "note": "4.6",
        "lieu": "Douala,pk21",
        "Distance": "8Km",
      },
    ];

    return dataProvider;
  }

  List<Map<String, String>> getAllDataPromo() {
    List<Map<String, String>> dataPromo = [
      {
        "img": "img/promo1.png",
      },
      {
        "img": "img/promo3.png",
      },
      {
        "img": "img/promo2.png",
      }
    ];

    return dataPromo;
  }

   List<Map<String, String>> getFreeSubscription() {
    List<Map<String, String>> dataFreeSubscription = [
      {
        "icon":"img/service-icon.svg",
        "offer":"3 services"
      },
      {
        "icon":"img/offre-icon.svg",
        "offer":"3 offres"
      },
      {
        "icon":"img/offre-icon.svg",
        "offer":"15% commissions"
      },
      {
        "icon":"img/transaction-icon.svg",
        "offer":"3 transactions"
      },
      
    ];
    
    List<Map<String, String>> dataExtraSubscription = [
      {
        "icon":"img/service-icon.svg",
        "offer":"10 services"
      },
      {
        "icon":"img/offre-icon.svg",
        "offer":"10 offres"
      },
      {
        "icon":"img/offre-icon.svg",
        "offer":"10% commissions"
      },
      {
        "icon":"img/transaction-icon.svg",
        "offer":"25 transactions"
      },
      {
        "icon":"img/promotion-icon.svg",
        "offer":"02 promotions"
      },
      {
        "icon":"img/assistance-icon.svg",
        "offer":"Assistance 24h/24"
      },
      
    ];

    List<Map<String, String>> dataPremiumSubscription = [
      {
        "icon":"img/service-icon.svg",
        "offer":"Services illimités"
      },
      {
        "icon":"img/offre-icon.svg",
        "offer":"Offres illimités"
      },
      {
        "icon":"img/offre-icon.svg",
        "offer":"5% commissions"
      },
      {
        "icon":"img/transaction-icon.svg",
        "offer":"Transactions illimités"
      },
      {
        "icon":"img/promotion-icon.svg",
        "offer":"Promotions illimités"
      },
      {
        "icon":"img/assistance-icon.svg",
        "offer":"Assistance 24h/24"
      },
      
    ];

    return dataFreeSubscription;
  }
}
