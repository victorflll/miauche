class UserMock {
  static List<Map> list = [
    {
      "name": "Maria José",
      "email": "mariajose@gmail.com",
      "phone": "(82)98111-2233",
      "password": "12345678",
    },
    {
      "name": "José dos Santos",
      "email": "santos.jose@gmail.com",
      "phone": "(82)99922-1133",
      "password": "87654321",
    },
  ];

  fetch() async {
    return list;
  }
}
