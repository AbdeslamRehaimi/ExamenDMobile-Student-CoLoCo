class Offer{
  String titre;
  String adress;
  String superficie;
  String prix;
  String capacite;
  String nbreEtudianMax;
  String description;
  String photo;

  Map<String, dynamic> toJson()=>{
    'titre' : this.titre,
    'adress' : this.adress,
    'superficie': this.superficie,
    'prix': this.prix,
    'capacite': this.capacite,
    'nbreEtudianMax': this.nbreEtudianMax,
    'description': this.description,
    'photo': this.photo,
  };
}