class AnimalMock {
  static List<Map> list = [
    {
      "name": "Bob",
      "age": "1 ano",
      "hasCollor": "Sim",
      "hasDeficiency": "Não",
      "animalType": "Cachorro",
      "gender": "Macho",
      "size": "Pequeno",
      "fur": "Curta",
      "furCollor": "Marrom",
      "additionalFeatures": "",
    },
  ];

  fetch() async {
    return list;
  }
}
