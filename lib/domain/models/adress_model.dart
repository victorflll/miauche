class Adress {

      late String CEP;
      late String city;
      late String neighborhood;
      late String street;
      late String houseNumber;
      late String complement;

      Adress ({required this.CEP, required this.city, required this.neighborhood, 
               required this.street, required this.houseNumber, required this.complement});

      Map toMap() {
              Map data = {};

              data['CEP'] = this.CEP;
              data['city'] = this.city;
              data['neighborhood'] = this.neighborhood;
              data['street'] = this.street;
              data['houseNumber'] = this.houseNumber;
              data['complement'] = this.complement;

              return data;
      }

      Adress.fromMap(Map data) {
             this.CEP = data['CEP'];
             this.city = data['city'];
             this.neighborhood = data['neighborhood'];
             this.street = data['street'];
             this.houseNumber = data['houseNumber'];
             this.complement = data['complement'];
      }
}

