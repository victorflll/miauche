class LostAnimal {
  String? name;
  int? age;
  int? hasCollor;
  int? hasDeficiency;
  String? deficiency;
  String? animalType;
  String? gender;
  String? breed;
  String? size;
  String? fur;
  String? furCollor;
  String? additionalFeatures;
  String? cep;
  String? city;
  String? neighborhood;
  String? street;
  int? houseNumber;
  String? complement;
  String? newsName;
  String? description;
  String? phoneContact;
  String? reward;
  String? imagePath;

  LostAnimal(
      {required this.name,
      required this.age,
      required this.hasCollor,
      required this.hasDeficiency,
      required this.animalType,
      required this.gender,
      required this.breed,
      required this.size,
      required this.fur,
      required this.furCollor,
      required this.additionalFeatures,
      required this.cep,
      required this.city,
      required this.neighborhood,
      required this.street,
      required this.houseNumber,
      required this.complement,
      required this.newsName,
      required this.description,
      required this.phoneContact,
      required this.reward,
      required this.imagePath});

  LostAnimal.fromJson(Map<String, dynamic> data) {
    name = data['animal_name'];
    age = data['age'];
    hasCollor = data['has_collor'];
    hasDeficiency = data['has_deficiency'];
    deficiency = data['deficiency'];
    animalType = data['animal_type'];
    gender = data['gender'];
    breed = data['breed'];
    size = data['size'];
    fur = data['fur'];
    furCollor = data['fur_collor'];
    additionalFeatures = data['additional_features'];
    cep = data['CEP'];
    city = data['city'];
    neighborhood = data['neighborhood'];
    street = data['street'];
    houseNumber = data['house_number'];
    complement = data['complement'];
    newsName = data['news_name_lost'];
    description = data['description'];
    phoneContact = data['phone_contact'];
    reward = data['reward'];
    imagePath = data['image_path'];
  }

  @override
  String toString() {
    return 'LostAnimal{name = $name, age = $age, hasCollor = $hasCollor, hasDeficiency = $hasDeficiency, deficiency =$deficiency, animalType = $animalType, gender = $gender, breed = $breed, size = $size, fur = $fur, furCollor = $furCollor, additionalFeatures = $additionalFeatures, cep = $cep, city = $city, neighborhood = $neighborhood, street = $street, houseNumber = $houseNumber, complement = $complement, newsName = $newsName, description = $description, phoneContact = $phoneContact, reward = $reward, imagePath = $imagePath},';
  }
}
