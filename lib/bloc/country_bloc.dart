import 'dart:convert';

import 'package:country_list_bloc/model/country_model.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';

class CountryBloc {
  CountryBloc() {
    loadCountryList();
  }

  final _countries = BehaviorSubject<List<CountryModel>>();

  // getters

  Stream<List<CountryModel>> get country => _countries.stream;

  //setters

  Function(List<CountryModel>) get countryList => _countries.sink.add;

  dispose() {
    _countries.close();
  }

  void loadCountryList() async {
    List<CountryModel> listOfCountries = [];
    try {
      var response = await http.post(
        Uri.parse('http://15.207.218.57/gujaratis-online/public/api/countries'),
      );
      var json = jsonDecode(response.body)['country'];

      json.forEach((data) => listOfCountries.add(CountryModel.fromJson(data)));
    } catch (error) {
      print(error.toString());
    }

    countryList(listOfCountries);
  }

  void loadStateList(String id) async {
    List<CountryModel> listOfCountries = [];
    try {
      var response = await http.post(
        Uri.parse('http://15.207.218.57/gujaratis-online/public/api/states'),
        body: jsonEncode({'country_id': '$id'}),
      );
      var json = jsonDecode(response.body)['states'];

      json.forEach((data) => listOfCountries.add(CountryModel.fromJson(data)));
    } catch (error) {
      print(error.toString());
    }

    countryList(listOfCountries);
  }
}
