class CountryModel {
  final String name;
  final int id;

  CountryModel({this.name, this.id});

  CountryModel.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        id = parsedJson['id'];
}
