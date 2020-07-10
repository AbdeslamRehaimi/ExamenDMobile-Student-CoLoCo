class Offer{
  String titre;
  String adress;
  String superficie;
  String prix;
  String capacite;
  String description;
  String photo;
  String userIdOffer;
  //String userIdDemand;
  //String userIdDemandTel;
  String tel;

  Offer(this.titre, this.adress, this.superficie, this.prix, this.capacite, this.description, this.photo, this.tel);

  Map<String, dynamic> toJson()=>{
    "titre" : this.titre,
    "adress" : this.adress,
    "superficie": this.superficie,
    "prix": this.prix,
    "capacite": this.capacite,
    "description": this.description,
    "photo": this.photo, 
    "tel" : tel
  };
}