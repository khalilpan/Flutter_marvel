class AllHeroesReponse {
  String name;
  String path;
  String extensionHeroes;
  String description;



  AllHeroesReponse.fromMappedJson(Map<String, dynamic> json) {
      name = json['name'] ?? "";
      path = json['thumbnail']['path'] ?? "";
      description = json['description']?? "";      
      extensionHeroes = json['thumbnail']['extension'] ?? "";
  }

}