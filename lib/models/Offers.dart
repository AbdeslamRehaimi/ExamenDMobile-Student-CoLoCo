class Offer{
  String titre;
  String adress;
  String superficie;
  String prix;
  String capacite;
  String description;
  String photo;
  String userIdOffer;
  String userIdDemand;
  String userIdDemandTel;
  String tel;

  Map<String, dynamic> toJson()=>{
    'titre' : this.titre,
    'adress' : this.adress,
    'superficie': this.superficie,
    'prix': this.prix,
    'capacite': this.capacite,
    'description': this.description,
    'photo': this.photo,
    'userIdOffer' : this.userIdOffer,
    'userIdDemand' : this.userIdDemand,
    'userIdDemandTel' : this.userIdDemandTel,
    'tel' : tel,
  };
}