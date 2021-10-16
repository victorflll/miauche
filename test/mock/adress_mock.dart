class AdressMock {
  static List<Map> list = [
    {
      "CEP": "12345-678",
      "city": "Arapiraca",
      "neighborhood": "Novo Horizonte",
      "street": "José Aranda Valeriano",
      "houseNumber": "123",
      "complement": "",
    },
  ];

  fetch() async {
    return list;
  }
}
